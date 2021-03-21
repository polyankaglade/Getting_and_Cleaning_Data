## Original data

This project uses following data (obtained on *21.03.2021* from the link mentioned in this repo's `README.md`): 
- from `/Raw_data/UCI HAR Dataset`:
	- `features.txt`: contains all the variable names, corresponding to each column of `x_train` and `x_test` sets. For more info on these features see `features_info.txt`
	- `activity_labels.txt`: contains the desciptive names for activity labels, corresponding to numbers in `y_train` and `y_test` sets.
- from `/Raw_data/UCI HAR Dataset/train`:
	- `x_train.txt`: contains observations of different measurements, described in `features_info.txt`
	- `y_train.txt`: contains activity for each observation
	- `subject_train`: contains subjects' ID for each observation
- from `/Raw_data/UCI HAR Dataset/test`:
	- same as above, but for test data.

For more info see `README.md` inside the dataset folder.
## Tools

The main script `run_analysis.R` exploits the `data.table` and `tidyverse` packages to perform some modifications on the original data, following course instructions.

## Modifications made

1. The training and the test sets merged to create one data set.
	1. binding `x_train` and `x_test` by rows
	2. binding `y_train` and `y_test` by rows
	3. binding `subject_train` and `subject_test` by rows
	4. binding resulting 3 data sets by columns
2. The data set appropriately labeled with descriptive variable names from `features.txt`. 
3. Only the measurements on the mean and standard deviation for each measurement extracted, done by using `select(match())` and regulat expressions.
	- `(` and `)` characters removed from column names for the ease or reading using the `rename_with()` and custom renaming function.
4. Descriptive activity names from `activity_labels.txt` used to name the activities in the data set, by creating a new variable `activity_label` using `mutate()`.
5. A second, independent tidy data set `averagedData` created,  with the average of each variable for each activity and each subject.
6. Data saved to `/Processed_data/averagedata.txt` and `/Processed_data/averagedata.csv` without rownames.

## Resulting data

The ouput of the modifications described above is a dataset of 180 observations with the following 69 variables:
1. `activity_label`: the name of the activity (levels: *WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING*).
2. `subject`: ID of a subject (from 1 to 30)
3. `activity`: numeric labels of activities (from 1 to 6)
4. other 66 variables: averaged values of the required features (measurements on the mean and standard deviation). For more info about each  feature refer to `features_info.txt`, provided with oridinal data.