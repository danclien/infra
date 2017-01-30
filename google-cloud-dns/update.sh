#!/usr/bin/env bash

zone_name=$1
zone_file=$zone_name

echo "Updating zone, ${zone_name}, with zone file, ${zone_file}..."

gcloud dns record-sets import "${zone_file}" --zone-file-format --zone=${zone_name}
# --delete-all-existing
