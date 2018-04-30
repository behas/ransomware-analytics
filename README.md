# Ransomware Payments in the Bitcoin Ecosystem | Analytics

This repository contains the official procedure for analyzing the expanded ransomware
dataset produced by the extraction procedure available in [this repository](https://github.com/behas/ransomware-dataset).


## Usage

Possibility 1: Run extraction procedure (to have an updated version of the blockchain) 

Possibility 2a: Download the dataset [expanded dataset](https://storage.googleapis.com/graphsense-dumps/ransomware/ransomware_dataset_04_11_2018.tar.gz) and save it into `./dataset/`

The dataset is based on an expansion made on October 28th, 2017 with 489,181 blocks, 260,167,622 transactions and 312,506,384 addresses in the Blockchain.

Possibility 2b: Execute the provided download and extraction script

    ./fetch_dataset_gcloud.sh


Open `empirical_analysis.Rmd` in [R Studio](https://www.rstudio.com/) and run it.
