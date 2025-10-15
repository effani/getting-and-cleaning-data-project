# Getting and Cleaning Data course project

This is the course project for the Coursera course Getting and Cleaning Data.

This project uses data collected from accelerometers for activity tracking. Data were collected on 30 volunteers who performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying down) while wearing a Samsung Galaxy S II smartphone on the waist.

The code in this repository loads the data into R, extracts mean and standard deviation values, tidies the data, and summarizes the values by subject (i.e., volunteer) and activity.

Data for this project are available [here](<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and more information is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Note that raw data files are not included in the github repo due to large file sizes. The code will not run unless you download the data (linked above) to a folder called "data".

## Files included in this repo:
1. README.md - this file
2. run_analysis.R - code to import, tidy, and summarize the data, and then write the output to data_summary.txt
3. CodeBook.md - file describing variables in the final tidy dataset
4. data_summary.txt - output of run_analysis.R

## Change log
The original version of this project was submitted for the course on October 8 2025 (commit 0e20a72). As I was grading my peers and waiting for my own submission to be graded, I realized that my solution, though functional, was inelegant and overcomplicated. Sorry to my peers who had to slog through this version to grade it! Thank you for the passing grade, which I'm not convinced I deserved.

Therefore, once grading was complete I came back to implement a simpler, more efficient solution. If for some bizarre reason someone is trying to use my code to solve this problem, I strongly recommend using the latest version, not the version that was submitted for the course.