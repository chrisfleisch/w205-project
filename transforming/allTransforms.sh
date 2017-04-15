#!/bin/bash
./createTransforms.sh
hive -f transforms.sql
hive -f secondtransforms.sql
