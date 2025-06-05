#!/bin/bash

# Variables
KEY_NAME="shadaab-key"
SECURITY_GROUP="nginx-sg"
INSTANCE_NAME="nginx-ec2"
AMI_ID="ami-0c02fb55956c7d316"  # Ubuntu 22.04 (verify latest for your region)
INSTANCE_TYPE="t2.micro"

echo "Creating security group..."
aws ec2 create-security-group --group-name $SECURITY_GROUP --description "Allow Nginx HTTP traffic"

echo "Adding inbound rules..."
aws ec2 authorize-security-group-ingress \
  --group-name $SECURITY_GROUP \
  --protocol tcp \
  --port 80 \
  --cidr 0.0.0.0/0

echo "Launching EC2 instance..."
INSTANCE_ID=$(aws ec2 run-instances \
  --image-id $AMI_ID \
  --count 1 \
  --instance-type $INSTANCE_TYPE \
  --key-name $KEY_NAME \
  --security-groups $SECURITY_GROUP \
  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME}]" \
  --query 'Instances[0].InstanceId' \
  --output text)

echo "Waiting for instance to be running..."
aws ec2 wait instance-running --instance-ids $INSTANCE_ID

PUBLIC_IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)

echo "Public IP: $PUBLIC_IP"

echo "Sleeping 60s for instance to be ready..."
sleep 60

echo "Installing Nginx via SSH..."
ssh -o StrictHostKeyChecking=no -i ~/.ssh/${KEY_NAME}.pem ubuntu@$PUBLIC_IP <<EOF
  sudo apt update
  sudo apt install nginx -y
  sudo systemctl enable nginx
  sudo systemctl start nginx
EOF

echo "✅ Nginx deployed at http://$PUBLIC_IP"
