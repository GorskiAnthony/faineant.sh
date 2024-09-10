#!/bin/bash

# Check if the gh CLI is installed
if ! command -v gh &> /dev/null
then
    echo "GitHub CLI (gh) is not installed. Please install it first."
    exit 1
fi

# Check if the user is authenticated
if ! gh auth status &> /dev/null
then
    echo "You are not authenticated with GitHub CLI. Please run 'gh auth login' first."
    exit 1
fi

# Prompt for the organization name
read -p "Enter the GitHub organization name: " orga

# Check if the organization exists and the user has access to it
if ! gh org ls "$orga" &> /dev/null
then
    echo "Organization $orga does not exist or you don't have access to it."
    exit 1
fi

# Prompt for the team name
read -p "Enter the team name: " team

# Check if the team exists in the organization
if ! gh api "orgs/$orga/teams/$team" &> /dev/null
then
    echo "Team $team does not exist in organization $orga."
    exit 1
fi

# Prompt for the file containing GitHub usernames
read -p "Enter the path to the file containing GitHub usernames (one per line): " username_file

# Check if the file exists
if [ ! -f "$username_file" ]
then
    echo "File $username_file does not exist."
    exit 1
fi

while IFS= read -r username
do
   echo "Inviting $username to team $team in organization $orga..."
    
    command="gh api -X PUT orgs/$orga/teams/$team/memberships/$username" 
    
    echo "Executing: $command"
    
    response=$(eval $command)
    
    if [ $? -eq 0 ]
    then
        echo "Invitation sent successfully to $username"
    else
        echo "Failed to send invitation to $username"
    fi
    
    echo "Response: $response"
    echo "---"
done < "$username_file"

echo "Invitation process completed."