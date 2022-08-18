#!/bin/bash

# *** Change this to the desired name of the Cloudformation stack of 
# your Pipeline (*not* the stack name of your app)
CODEPIPELINE_STACK_NAME="github-codepipeline"

# if [ -z ${1} ]
# then
# 	echo "PIPELINE CREATION FAILED!"
#         echo "Pass your Github OAuth token as the first argument"
# 	exit 1
# fi

# set -eu

# aws cloudformation create-stack \
#         --capabilities CAPABILITY_IAM \
#         --stack-name $CODEPIPELINE_STACK_NAME \
#         --parameters ParameterKey=GitHubOAuthToken,ParameterValue=${1} \
#         --template-body file://automation/pipeline.yaml

aws cloudformation deploy \
        --template-file ./automation/pipeline.yaml \
        --stack-name $CODEPIPELINE_STACK_NAME \
        --parameter-overrides "file://./automation/config/pipeline.json"