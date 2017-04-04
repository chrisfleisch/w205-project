#!/bin/bash
cd loading_and_modelling
./load_data_lake.sh
cd ../transforming
./allTransforms.sh

# export data from hive
hive -e 'set hive.cli.print.header=true;select * from whiskey_business;' | sed 's/[\t]/,/g' | sed 's/whiskey_business\.//g' > export_data/data/whiskey_business.csv
# export data from csv to google sheets
python export_data/spreadsheet.py
