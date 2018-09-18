#!/bin/bash

# Exit if any of the intermediate steps fail
set -e

# Set environment variables
eval "$(jq -r '@sh "AZURE_RESOURCE_GROUP=\(.az_resource_group) AZURE_STORAGE_ACCOUNT=\(.az_storage_account)"')"

# Fetching static-website endpoint and return in JSON format
ENDPOINT=$(az storage account show -n ${AZURE_STORAGE_ACCOUNT} -g "${AZURE_RESOURCE_GROUP}" --query "primaryEndpoints.web" --output tsv | awk -F[/:] '{print $4}')

# Return primary web endpoint
jq -n --arg endpoint "$ENDPOINT" '{"endpoint":$endpoint}'
