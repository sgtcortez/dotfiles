#!/bin/bash

LAMBDA=$1


# If we need to access aws secrets for example, we need to share the token that is stored under this folder
DEFAULT_AWS_CONFIG_PATH="$HOME/.aws"
TEMPLATE=template.yml
DEBUG_PORT=5858

FUNCTION="${LAMBDA:=none}"

command="sam local invoke --template $TEMPLATE  --debug --skip-pull-image --debug-port $DEBUG_PORT --docker-volume-basedir $DEFAULT_AWS_CONFIG_PATH "${@:2}" $FUNCTION" 
echo $command
eval $command