#!/bin/bash


# If we need to access aws secrets for example, we need to share the token that is stored under this folder
# you may need to be connected to aws.
DEFAULT_AWS_CONFIG_PATH="$HOME/.aws"

DEBUG_PORT=5858
PORT=8081
TEMPLATE=template.yml

command="sam local start-lambda --template $TEMPLATE --port $PORT --debug --skip-pull-image --debug-port $DEBUG_PORT --docker-volume-basedir $DEFAULT_AWS_CONFIG_PATH" 
echo $command
eval $command