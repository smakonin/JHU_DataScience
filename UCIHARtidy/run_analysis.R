# Copyright (C) 2014 by Stephen Makonin.

library(plyr)
library(reshape2)

# set the working dir and load the dataset files
# you will need to downlaod and unzip the dataset to the working dir
setwd("~/SourceCode/datasciencecoursera/")
dataset_dir = "UCI HAR Dataset/"
activity_labels <- read.table(paste(dataset_dir, "activity_labels.txt", sep = ""))
features <-  read.table(paste(dataset_dir, "features.txt", sep = ""))
train_subject <-  read.table(paste(dataset_dir, "train/subject_train.txt", sep = ""))
train_y <-  read.table(paste(dataset_dir, "train/y_train.txt", sep = ""))
train_x <-  read.table(paste(dataset_dir, "train/X_train.txt", sep = ""))
test_subject <-  read.table(paste(dataset_dir, "test/subject_test.txt", sep = ""))
test_y <-  read.table(paste(dataset_dir, "test/y_test.txt", sep = ""))
test_x <-  read.table(paste(dataset_dir, "test/X_test.txt", sep = ""))

# find wich features are mean and standard deviation measurements
keep <- c(grep("mean", features$V2, ignore.case = TRUE), 
          grep("std", features$V2, ignore.case = TRUE))
keep <- sort(keep)

# give the columns descriptive variable names
names(train_subject) <- "Subject"
names(test_subject) <- "Subject"
names(train_y) <- "Activity"
names(test_y) <- "Activity"
xlbl <- as.vector(features[,2], mode="any")
names(train_x) <- xlbl
names(test_x) <- xlbl

# combine the train files as columns
train <- cbind(train_subject, train_y, train_x[keep])
rm(train_subject, train_x, train_y)

# combine the test files as columns
test <- cbind(test_subject, test_y, test_x[keep])
rm(test_subject, test_x, test_y)

# merge the trainign and test data
full <- rbind(train, test)
rm(train, test)

# replace activity ids with activity names
full$Activity <- activity_labels[full$Activity, 2]

# creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject.
tall <- melt(full, id=c("Subject", "Activity"))
rm(full)
tidy <- aggregate(tall[4], by=tall[1:3], FUN=mean)
names(tidy) <- c("Subject", "Activity", "Feature", "Average")
rm(tall)

# save the dataset to disk
write.table(tidy, file="UCIHARtidy.txt", row.names = FALSE)
