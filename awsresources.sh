#!/bin/bash

# Setting variables are very important and should be done first

REGION="us-east-1/eu-north-1/eu-east-1"
BUCKET_NAME="any-unique-name-$(date)" #date is set for when you want to create it
AMI_ID="OsImage"  #eg-"ami-0c94855ba95c71c99"Amazon Linux 2 AMI for us-east-1
INSTANCE_TYPE="t2.micro/t3.micro" #depending on what you need
KEY_NAME="my-key"  # Make sure this key pair already exists in your AWS account or else you will get an error

# Create S3 bucket

echo "Creating S3 bucket: $BUCKET_NAME..."
aws s3api create-bucket \
  --bucket "$BUCKET_NAME" \
  --region "$REGION" \
  --create-bucket-configuration LocationConstraint="$REGION"

# Launch EC2 instance
echo "Launching EC2 instance right now now now..."
aws ec2 run-instances \
  --image-id "$AMI_ID" \
  --instance-type "$INSTANCE_TYPE" \
  --key-name "$KEY_NAME" \
  --region "$REGION" \
  --count 1

echo "Done!"
