#!/bin/bash

# Load configuration variables
if [ -z "$1" ]; then
    echo "Usage: build.sh {action_name}"
    exit
fi
OW_ACTION_NAME=$1

echo "Updating dependencies"
result="$(php composer.phar install --prefer-dist --no-dev -o 2>&1)"
if [[ ${result} != *"Generating optimized"* ]]; then
    echo "Failed to update dependencies"
    echo $result
    exit
fi

echo "Creating Zip file"
result=`zip -r action.zip composer.* exec src/* vendor/*`
if [ $? != 0 ]; then
    echo "Failed to create zip file"
    echo $result
    exit
fi


echo "Updating OpenWhisk action '$OW_ACTION_NAME'"
result=`wsk action update --docker $OW_ACTION_NAME action.zip --web true`
if [[ ${result} != *"ok:"* ]]; then
    echo "Update failed"
    echo $result
    exit
fi
rm action.zip

echo "Invoking OpenWhisk action: wsk action invoke -br $OW_ACTION_NAME --param name Everyone"
wsk action invoke -br $OW_ACTION_NAME --param name Everyone
