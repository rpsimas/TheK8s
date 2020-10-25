#!/bin/bash

# This script triggers Jenkins builds remotely
# provided you have the necessary configurations set on
# your Jenkins node

# This script takes in 3 variables (Jenkins URL, User's name and API Key),
# 2 arguments (job-name, authentication token)
# and assumes that you don't have to build with parameters

# Pre-Requisites
# Jenkins v2.0+
# User API Key from $JENKINS_URL/securityRealm/user/$JENKINS_USER/configure
# Enable "Trigger Builds Remotely" option under "Build Triggers"
# Assign an authentication token for the project

# Variables
JENKINS_URL='http://localhost:8080/blue/pipelines'
JENKINS_USER='robadmin'
JENKINS_USER_API_KEY='zWzO74fnbTVmAb01XPKIhz4='
# If you're worried about the security of your personal API key,
# you could set it as an environment variable and pass it to the script

job=$1
token=$2

# Verification Integrity of Input Arguments
if [[ $# -ne 2 ]]; then
  echo "Uh, Uh! That's not the right number of arguments to trigger a remote Jenkins Build"
  echo "I'm taking a break for now. Bye."
  exit 1
fi

curl -X POST "https://$JENKINS_USER:$JENKINS_USER_API_KEY@$JENKINS_URL/job/$job/build?token=$token"