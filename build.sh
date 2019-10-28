#! /bin/bash

echo "Processing resources..."

function verify_db(){
    DB_NAME=$1
    TABLE_NAME=$2
    echo "---------------------------------------------------------------------"
    echo " $TABLE_NAME"
    echo "---------------------------------------------------------------------"
    echo "Tables:"
    sqlite3 $DB_NAME ".tables"
    echo "Table Info: $TABLE_NAME"
    sqlite3 $DB_NAME "PRAGMA table_info($TABLE_NAME)"
    echo "Table count(*): $TABLE_NAME"
    sqlite3 $DB_NAME "select count(*) from $TABLE_NAME"
    echo "Table head: $TABLE_NAME"
    sqlite3 -column -header $DB_NAME "select * from $TABLE_NAME LIMIT 10"
}

# -----------------------------------------------------------------------------
# data-oasis-ene-wind-solar-summary_00.db.gz
# -----------------------------------------------------------------------------
if [[ ! -e "data-oasis-ene-wind-solar-summary_00.db" ]]; then
    curl -O https://s3.us-west-1.wasabisys.com/eap/energy-dashboard/data/data-oasis-ene-wind-solar-summary/db/data-oasis-ene-wind-solar-summary_00.db.gz
    gunzip data-oasis-ene-wind-solar-summary_00.db.gz
else
    echo "data-oasis-ene-wind-solar-summary_00.db exists locally, skipping download."
fi

verify_db data-oasis-ene-wind-solar-summary_00.db report_data
