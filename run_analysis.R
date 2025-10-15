library(dplyr)

## import and combine data

train_data <- read.table("data/train/X_train.txt")
train_labels <- read.table("data/train/y_train.txt")
train_subjects <- read.table("data/train/subject_train.txt")

test_data <- read.table("data/test/X_test.txt")
test_labels <- read.table("data/test/Y_test.txt")
test_subjects <- read.table("data/test/subject_test.txt")

all_data <- rbind(test_data, train_data)
all_labels <- rbind(test_labels, train_labels)
all_subjects <- rbind(test_subjects, train_subjects)

# remove duplicate data to save memory 
rm(test_data, train_data, test_labels, train_labels, 
   test_subjects, train_subjects)


## add column names (features)

features <- read.table("data/features.txt")

# change from data frame to vector for clearer manipulation
features <- features$V2

# Find which features contain mean or standard deviation
# using regular expression to find "mean()" or "std()" in the feature names
mean_or_sd <- grep("mean\\(\\)|std\\(\\)", features)
# This produces a vector of indices where mean or standard deviation features
# can be found

wanted_features <- features[mean_or_sd]

# Remove parentheses
wanted_features <- sub("\\(\\)", "", wanted_features)

# Change hyphens to underscores for easier column selection later
wanted_features <- gsub("-", "_", wanted_features)

# Change "BodyBody" to "Body" - this seems to be a mistake based on features.txt
wanted_features <- sub("BodyBody", "Body", wanted_features)

# change "t" and "f" prefixes to "time_" and "freq_", respectively
wanted_features <- sub("^t", "time_", wanted_features)
wanted_features <- sub("^f", "freq_", wanted_features)

# in data frame, remove all columns except mean and standard deviation
all_data <- all_data[, mean_or_sd]

# Add final feature names
colnames(all_data) <- wanted_features



## add activity labels

activity_labels <- read.table("data/activity_labels.txt")

# clean up activity labels - make lowercase and change underscores to spaces
activity_labels <- activity_labels %>%
  mutate(labels = tolower(V2),
         labels = sub("_", " ", labels))

# change activity labels into a named vector that can be used as a dictionary
labels <- activity_labels$labels
names(labels) <- activity_labels$V1
  
# make activity column for the final dataset
activity <- labels[all_labels$V1]


## provide column name for subjects data

all_subjects <- all_subjects %>%
  rename(subject = V1)


## create final dataset with subject and activity columns

all_data <- cbind(all_subjects, activity, all_data)


## Create summary data table

data_summary <- all_data %>%
  group_by(subject, activity) %>%
  summarise(across(time_BodyAcc_mean_X:freq_BodyGyroJerkMag_std, mean))

write.table(data_summary, "data_summary.txt", row.names = FALSE)
