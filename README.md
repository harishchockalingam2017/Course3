# Course3: Collecting and Cleaning Data

This repo is for the project for the third course in the Data Science Specialization from John Hopkins on Coursera. In this course the student learns to gather data which can be from various resources. The collected data which is most often unorganized needs to be tidied for analysis. Thus this course teaches the student to collect, clean the data, and analyze the tidied data set. The following is submitted along with this readme:

1) a tidy data set 
2) a link to a Github repository with script for performing the analysis 
3) a code book that describes the variables, the data, and any transformations or work that is performed to clean up the data called CodeBook.md.

# Assignment
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users for wearable computing - One of the most exciting areas in all of data science right now. The data is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data for Assignment:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A script (run_analsys.R) was developed to do the following and to analyze the data:

1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement.
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names.
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# run_analysis.R
The script takes in a single argument which is the folder that contains the data file. The input has two sets of data: the training and test data. The script merges the two data sets and produces a tidy data set sorted by activity type: walking, walking_upstairs, walking_downstairs, sitting, standing, and laying.
