## CodeBook

This file describes the run_analysis. R code

The activity function extracts the various activity types "Walking" "Walking Upstairs" "Walking Downstairs"
"Sitting" "Standing" and "Laying"  as column Names

The merge.data function merges the train and test data by reading X_train, X_test, Y_train and Y_test test
files and by using the rbind function combines the data from the two files by creating into a list

The meanstd function extracts the averages and std for each column by using the sapply function and the combinedata function
combines all the x, y and subject data sets by using the cbind function

And finally using the ddply function the merged data is tidied.