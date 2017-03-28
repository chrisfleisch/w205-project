#!/bin/bash
./createTransforms.sh
hive -f transforms.sql
