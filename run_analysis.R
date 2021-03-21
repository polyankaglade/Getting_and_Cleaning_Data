# 0. Collect data
rawDir <- "./Raw_data"
zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "Raw_data.zip"
zipPath <- file.path(rawDir, zipFile)

if (!file.exists(rawDir)) {
  dir.create(rawDir)
  download.file(url = zipUrl, destfile = zipPath)
  unzip(zipfile = zipPath, exdir = rawDir)
}
dataDir <- file.path(rawDir, "UCI HAR Dataset")

# 1. Merge the training and the test sets to create one data set.

train_X <- read.table(file.path(dataDir, 'train', 'X_train.txt'))
train_Y <- read.table(file.path(dataDir, 'train', 'y_train.txt'))
train_subjects <- read.table(file.path(dataDir, 'train', 'subject_train.txt'))

test_X <- read.table(file.path(dataDir, 'test', 'X_test.txt'))
test_Y <- read.table(file.path(dataDir, 'test', 'y_test.txt'))
test_subjects <- read.table(file.path(dataDir, 'test', 'subject_test.txt'))


data_X <- rbind(train_X, test_X)
data_Y <- rbind(train_Y, test_Y)
data_subjects <- rbind(train_subjects, test_subjects)

data <- cbind(data_subjects, data_Y, data_X)

# 4. Appropriately label the data set with descriptive variable names.

feature_names <- read.table(file.path(dataDir, 'features.txt'))

raw_column_names <- c("subject", "activity", feature_names$V2)

colnames(data) <- raw_column_names

# 2. Extract only the measurements on the mean and standard deviation for each measurement.
# bonus: delete '()' from colunm names

library(tidyverse)

rename_function <- function(x) {
  gsub('\\(\\)', '', x)
}

data %>% 
  select(matches("(mean|std)\\(\\)|subject|activity")) %>% 
  rename_with(rename_function) -> filteredData

# 3. Use descriptive activity names to name the activities in the data set

activities <- read.table(file.path(dataDir, 'activity_labels.txt'))

filteredData %>% 
  mutate(activity_label = activities$V2[filteredData$activity]) -> labeledData

# 5. Create a second, independent tidy data set with the average of each 
# variable for each activity and each subject.

labeledData %>% 
  group_by(activity_label, subject) %>% 
  summarise_all(mean) -> averagedData

# 6. Save data
processedDir <- "./Processed_data"
processedFile <- "averagedata.csv"

if (!file.exists(processedDir)) {
  dir.create(processedDir)
}

write.csv(averagedData, 
          file.path(processedDir, processedFile),
          row.names = FALSE)

# Anna Polyanskaya, 2021