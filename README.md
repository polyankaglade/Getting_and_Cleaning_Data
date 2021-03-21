# Getting and Cleaning Data

This is a repository for the [Getting and Cleaning Data](https://www.coursera.org/learn/data-cleaning/home/welcome) Course Project.

Done by: *Anna Polyanskaya, 2021.*

## About the project (via Coursera)

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
The goal is to prepare tidy data that can be used for later analysis.

- The data for the project can be downloaded from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Repo contents
This repository is structured in the following way:

- `README.md` is this file, the short description of this project
- `/Raw_data` contains the .zip archive
- `/Raw_data/UCI HAR Dataset` is the unziped dataset
- `/Processed_data` contains the resulting dataset `averagedata` in `.txt` and `.csv` formats.
- `run_analysis.R` is the code, that produses the tidy dataset, mentioned above
- `CodeBook.md` contains the description of the variables, the data, and any transformations or work that was performed to clean up the data