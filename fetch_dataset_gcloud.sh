#!/bin/bash

filename="ransomware_dataset_04_11_2018.tar.gz"

if [ ! -f $filename ];
then
    echo "Downloading dataset from Google Cloud Storage..."
    curl -O https://storage.googleapis.com/graphsense-dumps/ransomware/$filename
else
    echo "Dataset file already downloaded."
fi

tar xfvz $filename