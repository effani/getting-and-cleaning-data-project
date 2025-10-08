# Getting and Cleaning Data course project

This is the course project for the Coursera course Getting and Cleaning Data.

This project uses data collected from accelerometers for activity tracking. Data were collected on 30 volunteers who performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying down) while wearing a Samsung Galaxy S II smartphone on the waist.

The code in this repository loads the data into R, extracts mean and standard deviation values, tidies the data, and summarizes the values by subject (i.e., volunteer) and activity.

Data for this project are available [here](<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and more information is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Note that raw data files are not included in the github repo due to large file sizes. The code will not run unless you download the data (linked above) to a folder called "data".

## Files included in this repo:
1. README.md - this file
2. run_analysis.R - code to import, tidy, and summarize the data
3. CodeBook.md - file describing variables in the final tidy dataset