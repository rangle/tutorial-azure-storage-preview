#!/bin/bash

echo "Check if storage_preview plugin needs to be installed..."
STORAGE_PREVIEW_INSTALLED=$(az extension list-available --output tsv | grep storage-preview | awk '{if($1=="True"){print "1"}else{print "0"}}')

if [ ${STORAGE_PREVIEW_INSTALLED} == "0" ] ; then
  echo "Installing storage_preview plugin ..."
  az extension add --name storage-preview
fi

echo "Log into Azure account ..."
az login --service-principal -u ${AZURE_CLIENT_ID} -p ${AZURE_CLIENT_SECRET} --tenant ${AZURE_TENANT_ID}

echo "Enabling static-website on Azure Storage Account: ${AZURE_STORAGE_ACCOUNT}"
az storage blob service-properties update --account-name ${AZURE_STORAGE_ACCOUNT} --static-website --404-document ${ERROR_DOCUMENT} --index-document ${INDEX_DOCUMENT}
