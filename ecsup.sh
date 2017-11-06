#!/bin/bash

echo "setting ecs-cli"
echo "aws access key "  ${AWS_ACCESS_KEY_ID}
echo "aws secret key "  ${AWS_SECRET_ACCESS_KEY}

EC2_VPC="vpc-ec1b4b88"
EC2_SECURITY_GROUP="sg-589f103e"
EC2_SUBNETS="subnet-06ad8c5e"
EC2_INSTANCE_TYPE="t2.micro"
EC2_INSTANCE_COUNT = $1

echo "EC2_INSTANCE_COUNT : " ${EC2_INSTANCE_COUNT}

#setting ecs-cli configure
ecs-cli configure --cluster testcodedeploy --region ap-northeast-1 --access-key ${AWS_ACCESS_KEY_ID} --secret-key ${AWS_SECRET_ACCESS_KEY}

echo "ecs instance up"
ecs-cli up --verbose --force --keypair nagatatk-stg --capability-iam --size ${EC2_INSTANCE_COUNT} --vpc ${EC2_VPC} --security-group ${EC2_SECURITY_GROUP} --instance-type ${EC2_INSTANCE_TYPE} --subnets ${EC2_SUBNETS}
echo "ecs container ps"

#ecs-cli ps --cluster testcodedeploy --region ap-northeast-1
ecs-cli ps
