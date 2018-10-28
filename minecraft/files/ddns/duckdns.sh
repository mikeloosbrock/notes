#!/bin/bash

domains="loosbrock-mc,superjoojoo"
token="e032ee8d-3f85-4717-9d21-57403cbbf438"

curl_exit=$(echo url="https://www.duckdns.org/update?domains=${domains}&token=${token}" | /usr/bin/curl -skK -)

if [ ${curl_exit} == "OK" ]; then
  logger -p daemon.info "duckdns update ok for {$domains}.duckdns.org"
else
  logger -p daemon.err "duckdns update failed for {$domains}.duckdns.org"
fi
