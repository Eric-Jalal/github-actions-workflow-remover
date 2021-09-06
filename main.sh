#!/bin/bash

# Colors:

Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
NC='\033[0m'              # No color
Cyan='\033[0;36m'         # Cyan

echo -e "Lets remove some redundant workflows from your Github Actions!"

echo -e "Make sure you have already 'gh' and 'jq' tools installed on your machine and you're logged in to your Github account through gh"

echo -e "${Cyan}Fetching workflow IDs${NC}"

gh workflow list

echo -e "${Red}Disabled workflows are not shown, please enable your workflow to be shown in the list${NC}"

echo -e "${Cyan}Please enter the workflow ID you need to remove then press ENTER to continue${NC}"

read -p 'Workflow ID: ' WORKFLOW_ID

echo "${Cyan}Fetching 10 latest workflow runs${NC}"

gh run list -L 10 -w $WORKFLOW_ID

echo "${Red}For double check is this the correct workflow you wanna remove?(Y/N)${NC}"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) REPO_INFO=$(gh repo view --json name,owner) && REPO_FULL_NAME="$(echo $REPO_INFO | jq '.owner.login' -r)/$(echo $REPO_INFO | jq '.name' -r)" && gh api -X GET "/repos/$REPO_FULL_NAME/actions/workflows/$WORKFLOW_ID/runs?per_page=100" | jq '.workflow_runs[] | .id' -r | xargs -t -I{} gh api --silent -X DELETE /repos/$REPO_FULL_NAME/actions/runs/{} && echo -e "${Green}Done!${NC}"
        No ) exit;;
    esac
done
