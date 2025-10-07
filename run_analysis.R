library(dplyr)

## Make dictionary to change labels from numbers to activity types
activity_labels <- readLines("data/activity_labels.txt")

# Use substr() to extract label (first character of each line)
# and activity (characters 3 to end of line)
# use 50 as arbitrarily high value for end to ensure the whole line is captured
activity_label_df <- data.frame(label = substr(activity_labels, 1, 1),
                                activity = substr(activity_labels, 3, 50))


## idk i'm figuring it out
features <- readLines("data/features.txt")
x_train <- readLines("data/train/X_train.txt")

# Each line in the "X" files (X_train.txt and X_test.txt) contains 561 elements
# corresponding to the list of features. All elements are numbers in scientific
# notation, stored in text format.
# The clean_data() function is intended to split these lines into a numeric
# vector.
clean_x_data <- function(xline) {
  xlist <- strsplit(xline, " ")
  # strsplit() returns a list whose only element is a character vector.
  # extract the vector, i.e. the first element of the list
  xvect <- xlist[[1]]
  
  # as.numeric() correctly reads the scientific notation
  xnumeric <- as.numeric(xvect)
  
  # return all non-NA values
  xnumeric[!is.na(xnumeric)]
}

x_train_list <- lapply(x_train, clean_x_data)
# this is a list of 7352 observations, each of which is a numeric vector with
# 561 elements 

# make each element of the list into one row of a dataframe
# and set the column names to the features vector (from features.txt)
x_train_df <- do.call("rbind", x_train_list)
colnames(x_train_df) <- features

# remove unnecessary intermediates to save memory
rm(x_train, x_train_list)
