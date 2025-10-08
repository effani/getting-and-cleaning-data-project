library(dplyr)

## import data
features <- readLines("data/features.txt")
activity_labels <- readLines("data/activity_labels.txt")

train_data <- readLines("data/train/X_train.txt")
train_labels <- readLines("data/train/y_train.txt")
train_subjects <- readLines("data/train/subject_train.txt")

test_data <- readLines("data/test/X_test.txt")
test_labels <- readLines("data/test/Y_test.txt")
test_subjects <- readLines("data/test/subject_test.txt")


## Change activity labels into a named vector that can be used as a dictionary

names(activity_labels) <- substr(activity_labels, 1, 1)
activity_labels <- substr(activity_labels, 3, 50)
# Set end value for substr() at 50
# this is longer than any of the strings 
# to ensure the whole activity name is captured


## Remove initial numbers from features list
## and determine which features contain mean and std
split_features <- strsplit(features," ")
features <- sapply(split_features, function(x) x[[2]])
mean_or_sd <- grepl("mean\\(\\)|std\\(\\)", features)
rm(split_features)


## Clean and merge data files

# Each line in the data files (X_train.txt and X_test.txt) contains 561 elements
# corresponding to the list of features. All elements are numbers in scientific
# notation, stored in text format.
# This function splits each of these lines into a numeric vector.

clean_data <- function(xline) {
  xlist <- strsplit(xline, " ")
  # strsplit() returns a list whose only element is a character vector.
  # extract the vector, i.e. the first element of the list
  xvect <- xlist[[1]]
  
  # as.numeric() correctly reads the scientific notation
  xnumeric <- as.numeric(xvect)
  
  # return all non-NA values
  xnumeric[!is.na(xnumeric)]
}

train_list <- lapply(train_data, clean_data)
test_list <- lapply(test_data, clean_data)
all_data_list <- c(train_list, test_list)
# this is a list of 10299 observations, each of which is a numeric vector with
# 561 elements 

# save memory by removing partial datasets
rm(train_data, test_data, train_list, test_list)

# make each element of the list into one row of a dataframe
# and set the column names to the features vector (from features.txt)
all_data <- do.call("rbind", all_data_list)
# This produces a matrix. Add column names and then use dplyr::as_tibble to 
# make a dataframe that will print relatively neatly.

colnames(all_data) <- features
all_data <- as_tibble(all_data)


## Extract only mean and standard deviation for each measurement
all_data <- all_data[, mean_or_sd]


## Add activity names and subjects to dataframe
subject <- as.integer(c(train_subjects, test_subjects))
# convert subject to integer to improve sorting

labels <- c(train_labels, test_labels)

all_data <- cbind(all_data, labels, subject) %>%
  mutate(activity = activity_labels[labels])


## Create summary data table
data_summary <- all_data %>%
  group_by(subject, activity) %>%
  summarise(avgtBodyAcc_X = mean(`tBodyAcc-mean()-X`))


