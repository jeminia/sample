#!/bin/bash

echo "setting ecs-cli"
echo "aws access key "  ${AWS_ACCESS_KEY_ID}
echo "aws secret key "  ${AWS_SECRET_ACCESS_KEY}

#setting ecs-cli configure
ecs-cli configure --cluster testcodedeploy --region ap-northeast-1 --access-key ${AWS_ACCESS_KEY_ID} --secret-key ${AWS_SECRET_ACCESS_KEY}

echo "ecs instance up"
ecs-cli up --verbose --force --keypair nagatatk-stg --capability-iam --size 1 --vpc vpc-ec1b4b88 --security-group sg-589f103e --instance-type t2.micro --subnets subnet-06ad8c5e
echo "ecs container ps"

#ecs-cli ps --cluster testcodedeploy --region ap-northeast-1
ecs-cli ps
