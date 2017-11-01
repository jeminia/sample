#!/bin/bash

echo "aws cli setting"

#export AWS_ACCESS_KEY_ID=AKIAJV4VZ6Q6QTNS7ZMA
#export AWS_SECRET_ACCESS_KEY=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
#export AWS_SECRET_ACCESS_KEY=ap-northeast-1

echo ${AWS_ACCESS_KEY_ID}
echo ${AWS_SECRET_ACCESS_KEY}
echo ${AWS_SECRET_ACCESS_KEY}

aws s3 ls
