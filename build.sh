#! /bin/bash

echo "Downloading resources..."

curl -O https://s3.us-west-1.wasabisys.com/eap/energy-dashboard/data/data-oasis-ene-wind-solar-summary/db/data-oasis-ene-wind-solar-summary_00.db.gz
gunzip data-oasis-ene-wind-solar-summary_00.db.gz
