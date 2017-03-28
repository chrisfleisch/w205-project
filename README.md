# w205-project

## Env setup

Setup conda env called "w205-project":

`conda env create -f environment.yml`

Activate env:

`source activate w205-project`

To remove the project:

`conda remove --name w205-project --all`


## Data setup

Download data to data source:

`python data_get/download.py`

Transform data in data source:

`python data_get/transform.py`

Put data into HDFS:

`cd loading_and_modelling`

`./load_data_lake.sh`

Transform data in hive:

`cd ../transforming`

`./createTransforms.sh`

`hive -f transforms.sql`

Pull final table down as CSV:

`hive -e 'select * from whiskey_business' | sed 's/[\t]/,/g'  > /home/w205/w205-project/whiskey_business.csv`

