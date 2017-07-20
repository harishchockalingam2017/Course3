#Merging data from test and train

library(plyr)

activityType = function(a) {

    # Gathering activity Type

    colName(a) <- "activity"

    a$activity[a$activity == 1] = "WALKING"
    a$activity[a$activity == 2] = "WALKING_UPSTAIRS"
    a$activity[a$activity == 3] = "WALKING_DOWNSTAIRS"
    a$activity[a$activity == 4] = "SITTING"
    a$activity[a$activity == 5] = "STANDING"
    a$activity[a$activity == 6] = "LAYING"
    a

}


merge.data = function() {
	 #reading x train data

    traindataX <- read.table("Users/Harish/Documents/coursera/datasciencecoursera/Course3/UCI HAR Dataset/train/X_train.txt")

#reading y train data  

    traindataY <- read.table("Users/Harish/Documents/coursera/datasciencecoursera/Course3/UCI HAR Dataset/train/y_train.txt")

 #reading subject_train

    trainSubject <- read.table("Users/Harish/Documents/coursera/datasciencecoursera/Course3/UCI HAR Dataset/train/subject_train.txt")

 
 #reading x test data

    testdataX <- read.table("Users/Harish/Documents/coursera/datasciencecoursera/Course3/UCI HAR Dataset/test/test/X_test.txt")

 #reading y test data

    testdataY <- read.table("Users/Harish/Documents/coursera/datasciencecoursera/Course3/UCI HAR Dataset/test/y_test.txt")

  #reading subject_test  

    testSubject <- read.table("/Users/Harish/Documents/coursera/datasciencecoursera/Course3/UCI HAR Dataset/test/subject_test.txt")

    # Merge test and train using rbind function

    mergeX <- rbind(traindataX, testdataX)

    mergeY <- rbind(traindataY, testdataY)

    mergeSubject <- rbind(trainSubject, testSubject)

    

    list(x=mergeX, y=mergeY, subject=mergeSubject)

}




meanstd = function(a) {

#Gathering data to get mean and std for x

          features <- read.table("Users/Harish/Documents/coursera/datasciencecoursera/Course3/UCI HAR Dataset/features.txt")

    

    mean <- sapply(features[,2], function(x) grepl("mean()", x, fixed=T))

    std <- sapply(features[,2], function(x) grepl("std()", x, fixed=T))
    

   

    res <- a[, (mean | std)]

    colName(res) <- features[(mean | std), 2]

    res

}


combineData <- function(x, y, subject) {


    cbind(x, y, subject)

}




tidyDataset = function(a) {

#Creating tidy dataset with x, y and averages and std   



    tidyData <- ddply(a, .(subject, activity), function(x) colMeans(x[,1:60]))

    tidyData

}




processData = function() {


    merge <- merge.data()

    xval <- meanstd(merge$x)

    yval <- activityType(merge$y)

    

    colName(merge$subject) <- c("subject")

    mergedData <- combineData(xval, yval, merge$subject)

    

    tidy <- tidyDataset(mergedData)

    

    write.csv(tidy, "tidyData_courses3.csv", row.names=FALSE)

}
