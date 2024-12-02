#!/bin/bash

set -o errexit; set -o nounset
set -o xtrace

/opt/tableau/tableau_bridge/bin/TabBridgeClientCmd setServiceConnection --service="$TC_SERVER_URL"
#/opt/tableau/tableau_bridge/bin/TabBridgeClientCmd setConfiguration --JSONLogForExtractRefresh=true
/opt/tableau/tableau_bridge/bin/TabBridgeClientWorker -e --client="${BRIDGE_INSTANCE_NAME}" \
   --site="${SITE_NAME}" \
   --userEmail="${USER_EMAIL}" \
   --patTokenId="${TOKEN_ID}" \
   --patTokenFile="${PAT_TOKEN_FILE}" \
   --poolId="${POOL_ID}"