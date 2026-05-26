#!/bin/bash


AMI_ID="ami-0220d79f3f480ecf5"

for instance in $@
do
    echo "Launching instance: $instance"
    INSTANCE_ID=$(aws ec2 run-instances \
        --image-id ami-0220d79f3f480ecf5 \
        --instance-type t3.micro \
        --security-groups "roboshop-common" "roboshop-$instance" \
        --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=roboshop-$instance}]" \
        --query 'Instances[0].InstanceId' \
        --output text
    )
    echo "Instance ID: $INSTANCE_ID"

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
    

done

 echo "All instances launched successfully."