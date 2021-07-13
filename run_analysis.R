library(dplyr)

setwd("/Users/RanjitS1/Documents/Rakendu/Coursera/Getting and Cleaning Data/Peer Review Assignment/UCI HAR Dataset")

# Obtain the Training Data by combining subject, activity and values
TrainingData <- read.table("./train/subject_train.txt", col.names = c("Subject"))
TrainingData <- cbind(TrainingData, read.table("./train/y_train.txt",col.names = "Activity"))
TrainingValues <- read.table("./train/X_train.txt", col.names = read.table("features.txt")[,2])
TrainingData <- cbind(TrainingData,select(TrainingValues,grep("mean",names(TrainingValues)),grep("std",names(TrainingValues))))

#Repeat the same for Test Data

TestData <- read.table("./test/subject_test.txt", col.names = c("Subject"))
TestData <- cbind(TestData, read.table("./test/y_test.txt",col.names = "Activity"))
TestValues <- read.table("./test/X_test.txt", col.names = read.table("features.txt")[,2])

# - 2. Extracts only the measurements on the mean and standard deviation for each measurement.
TestData <- cbind(TestData,select(TestValues,grep("mean",names(TestValues)),grep("std",names(TestValues))))

# Combine the rows of Train and Test
# - 1. Merges the training and the test sets to create one data set.
AllData <- rbind(TrainingData,TestData)

# - 3. Update the Activity Table to reflect the Activity Name instead of number in Activity Column
ActivityDesc <- read.table("activity_labels.txt")
AllData$Activity <- sapply(AllData$Activity,function(x)ActivityDesc[ActivityDesc[,1]==x,2])

# - 4. Appropriately labels the data set with descriptive variable names. 
# - 5. Creates independent tidy data set with the average of each variable for each activity and each subject.
tidyData <- AllData %>%
  group_by(Subject, Activity) %>%
  summarize(across(1:79,list(mean=mean),.names = "{.fn}.{.col}"))

write.table(tidyData,file="TidyData.txt",row.names=FALSE)