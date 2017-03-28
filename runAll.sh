#!/bin/bash
cd loading_and_modelling
./load_data_lake.sh
cd ../transforming
./allTransforms.sh
