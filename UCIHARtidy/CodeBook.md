# UCIHAR Tidy Dataset
Copyright (C) 2014 by Stephen Makonin.


Once the R script has run a file called **UCIHARtidy.txt** is created. Here is a description of each column found in this dataset. The [description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) of the original [UCI HAR dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) can explain in more detail some of the feature measurements listed below.

## Column 1: Subject
The study subject, a person identified by a unique **Integer**.

## Column 2: Activity
The activity performed. Values are expressed as **String** and can be one of:
1. WALKING
1. WALKING_UPSTAIRS
1. WALKING_DOWNSTAIRS
1. SITTING
1. STANDING
1. LAYING


## Column 3: Feature
Not all [features](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) were taken from the [original dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Values are expressed as **String**. The feature in this dataset are:
1. tBodyAcc-mean()-X                   
1. tBodyAcc-mean()-Y                   
1. tBodyAcc-mean()-Z                   
1. tBodyAcc-std()-X                    
1. tBodyAcc-std()-Y                    
1. tBodyAcc-std()-Z                    
1. tGravityAcc-mean()-X                
1. tGravityAcc-mean()-Y                
1. tGravityAcc-mean()-Z                
1. tGravityAcc-std()-X                 
1. tGravityAcc-std()-Y                 
1. tGravityAcc-std()-Z                 
1. tBodyAccJerk-mean()-X               
1. tBodyAccJerk-mean()-Y               
1. tBodyAccJerk-mean()-Z               
1. tBodyAccJerk-std()-X                
1. tBodyAccJerk-std()-Y                
1. tBodyAccJerk-std()-Z                
1. 9tBodyGyro-mean()-X                  
1. tBodyGyro-mean()-Y                  
1. tBodyGyro-mean()-Z                  
1. tBodyGyro-std()-X                   
1. tBodyGyro-std()-Y                   
1. tBodyGyro-std()-Z                   
1. tBodyGyroJerk-mean()-X              
1. tBodyGyroJerk-mean()-Y              
1. tBodyGyroJerk-mean()-Z              
1. tBodyGyroJerk-std()-X               
1. 9tBodyGyroJerk-std()-Y               
1. tBodyGyroJerk-std()-Z               
1. tBodyAccMag-mean()                  
1. tBodyAccMag-std()                   
1. tGravityAccMag-mean()               
1. tGravityAccMag-std()                
1. tBodyAccJerkMag-mean()              
1. tBodyAccJerkMag-std()               
1. tBodyGyroMag-mean()                 
1. tBodyGyroMag-std()                  
1. 9tBodyGyroJerkMag-mean()             
1. tBodyGyroJerkMag-std()              
1. fBodyAcc-mean()-X                   
1. fBodyAcc-mean()-Y                   
1. fBodyAcc-mean()-Z                   
1. fBodyAcc-std()-X                    
1. fBodyAcc-std()-Y                    
1. fBodyAcc-std()-Z                    
1. fBodyAcc-meanFreq()-X               
1. fBodyAcc-meanFreq()-Y               
1. 9fBodyAcc-meanFreq()-Z               
1. fBodyAccJerk-mean()-X               
1. fBodyAccJerk-mean()-Y               
1. fBodyAccJerk-mean()-Z               
1. fBodyAccJerk-std()-X                
1. fBodyAccJerk-std()-Y                
1. fBodyAccJerk-std()-Z                
1. fBodyAccJerk-meanFreq()-X           
1. fBodyAccJerk-meanFreq()-Y           
1. fBodyAccJerk-meanFreq()-Z           
1. 9fBodyGyro-mean()-X                  
1. fBodyGyro-mean()-Y                  
1. fBodyGyro-mean()-Z                  
1. fBodyGyro-std()-X                   
1. fBodyGyro-std()-Y                   
1. fBodyGyro-std()-Z                   
1. fBodyGyro-meanFreq()-X              
1. fBodyGyro-meanFreq()-Y              
1. fBodyGyro-meanFreq()-Z              
1. fBodyAccMag-mean()                  
1. 9fBodyAccMag-std()                   
1. fBodyAccMag-meanFreq()              
1. fBodyBodyAccJerkMag-mean()          
1. fBodyBodyAccJerkMag-std()           
1. fBodyBodyAccJerkMag-meanFreq()      
1. fBodyBodyGyroMag-mean()             
1. fBodyBodyGyroMag-std()              
1. fBodyBodyGyroMag-meanFreq()         
1. fBodyBodyGyroJerkMag-mean()         
1. fBodyBodyGyroJerkMag-std()          
1. 9fBodyBodyGyroJerkMag-meanFreq()     
1. angle(tBodyAccMean,gravity)         
1. angle(tBodyAccJerkMean),gravityMean)
1. angle(tBodyGyroMean,gravityMean)    
1. angle(tBodyGyroJerkMean,gravityMean)
1. angle(X,gravityMean)                
1. angle(Y,gravityMean)                
1. angle(Z,gravityMean)


## Column 4: Average
This is the *average* of all the measurements for each Subject, Activity, and Feature. Values are expressed in **Float**.