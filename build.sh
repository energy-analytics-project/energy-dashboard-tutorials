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
    DB_NAME=$1
    TABLE_NAME=$2
    echo "---------------------------------------------------------------------"
    echo "Verifying: $DB_NAME.$TABLE_NAME"
    echo "---------------------------------------------------------------------"
    echo "Table Info: $TABLE_NAME"
    sqlite3 $DB_NAME "PRAGMA table_info($TABLE_NAME)"
    echo "Table count(*): $TABLE_NAME"
    sqlite3 $DB_NAME "select count(*) from $TABLE_NAME"
    echo "Table head: $TABLE_NAME"
    sqlite3 -column -header $DB_NAME "select * from $TABLE_NAME LIMIT 10"
}

function retrieve()
{
    TARGET=$1; shift
    DB_NAME="$TARGET"_00.db
    echo "====================================================================="
    echo "$TARGET"
    echo "====================================================================="

    download $TARGET
    tables=$(sqlite3 $DB_NAME ".tables" | tr -s ' ' '\n')
    for table in $tables; do
        verify $DB_NAME $table
    done
}

# -----------------------------------------------------------------------------
# CAISO OASIS Reports
# -----------------------------------------------------------------------------
retrieve data-oasis-ene-wind-solar-summary
retrieve data-oasis-sld-ren-fcst-dam
retrieve data-oasis-daily-renewables-output
