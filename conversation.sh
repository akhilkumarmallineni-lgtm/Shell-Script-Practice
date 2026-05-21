#!/bin/bash

# Variables for conversation participants
person1="Iran"
person2="Trump"

# Conversation topic and metadata
topic="Nuclear Diplomacy"
greeting="--- Conversation between $person1 and $person2 ---"
closing="--- End of Conversation ---"

# Dialogue messages
msg1="We need a calm dialogue to avoid escalation."
msg2="America wants strength, but diplomacy is still possible."
msg3="Our nation seeks respect and security in the region."
msg4="If we can find common ground, sanctions can be discussed."
msg5="Let's agree on clear terms and avoid new conflict."
msg6="The world watches, and peace is our shared responsibility."

# Display conversation
echo "$greeting"
echo "Topic: $topic"
echo ""

echo "$person1: $msg1"
echo "$person2: $msg2"
echo "$person1: $msg3"
echo "$person2: $msg4"
echo "$person1: $msg5"
echo "$person2: $msg6"

echo ""
echo "$closing"
