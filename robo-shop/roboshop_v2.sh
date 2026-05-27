#!/bin/bash

AMI_ID="ami-0220d79f3f480ecf5"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $# -lt 2 ]; then
    echo -e "$R Error: At least 2 arguments should be passed. $N"
    echo "$Y Usage: $0 create/delete instance_name1 instance_name2 ... $N"
    exit 1
fi

ACTION=$1
shift  #to remove the first argument and keep the rest as instance names

if [ "$ACTION" != "create" ] && [ "$ACTION" != "delete" ]; then
    echo -e "$R ERROR:: First argument must be either create or delete $N"
    echo "USAGE: $0 [create/delete] [instance1] [instance2...]"
    exit 1
fi

get_instance_id() {
    name=$1
    aws ec2 describe-instances --filters "Name=tag:Name,Values=roboshop-$name" "Name=instance-state-name,Values=running" --query "Reservations[0].Instances[0].InstanceId" --output text
}

for instance in $@
do
    if [ "$ACTION" == "create" ];then
        INSTANCE_ID=$(get_instance_id $instance)
        if [ $INSTANCE_ID == "None" ]; then
            echo "Creating instance: $instance"
            INSTANCE_ID=$( aws ec2 run-instances \
            --image-id $AMI_ID \
            --instance-type t3.micro \
            --security-groups "shell-robo-common" "roboshop-$instance" \
            --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=roboshop-$instance}]" \
            --query 'Instances[0].InstanceId' \
            --output text 
            )
            echo "Launched Instance: $INSTANCE_ID"
            # Create instance command here
        else
            echo "Instance $instance already exists with ID: $INSTANCE_ID"
        fi
        if [ $instance == "frontend" ]; then
            IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID \
             --query 'Reservations[*].Instances[*].PublicIpAddress' \
             --output text
            )
            echo "Access the frontend at: http://$IP"
        else
            IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID \
             --query 'Reservations[*].Instances[*].PrivateIpAddress' \
             --output text
            )
            echo "Private IP for $instance: $IP"
        fi
    else
        if [ $INSTANCE_ID = "None" ]; then
            INSTANCE_ID=$(get_instance_id $instance)
            echo "$instance already destroyed, nothing to do..."
        else
            aws ec2 terminate-instances --instance-ids $INSTANCE_ID
            echo "Terminating Instance: $instance"
        fi
    fi
done