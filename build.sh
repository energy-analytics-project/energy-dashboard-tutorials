#! /bin/bash

echo "Processing resources..."

function download()
{
    TARGET="$1"
    DB_NAME="$TARGET"_00.db
    TGZ_NAME=$DB_NAME.gz
    URL=https://s3.us-west-1.wasabisys.com/eap/energy-dashboard/data/$TARGET/db/$TGZ_NAME

    echo "---------------------------------------------------------------------"
    echo "Downloading: $URL"
    echo "---------------------------------------------------------------------"
    if [[ ! -e "$DB_NAME" ]]; then
        curl -O $URL
        gunzip $TGZ_NAME
    else
        echo "$DB_NAME exists locally, skipping download."
    fi
}

function verify()
{
    TARGET="$1"
    DB_NAME="$TARGET"_00.db
    TABLE_NAME=$2
    echo "---------------------------------------------------------------------"
    echo "Verifying: $TABLE_NAME"
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

function retrieve()
{
    download $1
    verify $1 $2
}

# -----------------------------------------------------------------------------
# CAISO OASIS Reports
# -----------------------------------------------------------------------------
retrieve data-oasis-ene-wind-solar-summary report_data
retrieve data-oasis-sld-ren-fcst-dam report_data
