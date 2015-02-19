# Getting and Cleaning Data Project
This Project is for the Coursera course "Getting and Cleaning Data" part of the Data Science Specialization provided by the Johns Hopking University.


---


## Raw Data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The initial dataset included the following files:

- 'README.txt'
* 'features.txt': List of all features (561 obs. of 2 variables)
* 'activity_labels.txt': Links the class labels with their activity name (6 obs. of 2 variables)
* 'train/X_train.txt': Training set (7352 obs. of 1 variable)
* 'train/y_train.txt': Training labels (7352 obs. of 1 variable)
* 'test/X_test.txt': Test set (2947 obs. of 561 variables)
* 'test/y_test.txt': Test labels (2947 obs. of 1 variable)

Some comment:

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


A full description of the analysis is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the original data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


---


## Processed Data 

A detailed description of the complete analysis script is available in the Readme file in the same repository.

* Initial variables: 561 variables + Subject + Activity
* The variables of the X_test and X_train data have been renamed according with the names available in the features file.
* The variables of the Y_test and Y_train data have been renamed as "Activity"
* The variable of the subject_test and subject_train data have been renamed as "Subject"
* A unique dataset (10299 obs. of 563 variables) of all the data has been created.
* From the complete dataset only the variables ending with mean() and std() have been selected. It has been decided not to include also the freqmean() variables, as in the description of the features_info file they are described as weighted average of the frequency components to obtain a mean frequency, which is different from the mean itself.
* The Activity variable has been recoded into a factor with 6 levels representing the different activities performed by the subjects ("LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS"). The "LAYING" activity has been transformed into "LYING" to fulfil the English Grammar rules.
* The variable names have been recoded to make them more readable and respect R rules. The Camel Case rule (writing all the initials as capital letter) has been applied. The parenthesis "(" and ")" have been removed.  "BodyBody" has been corrected in "Body". The initial "t" has been transformed in "Time" and the initial "f" in "Freq".
* A further mean classification has been applied to compute the average of each variable for each activity and each subject.
* Final variables of the tidy dataset: 66 variables + Subject + Activity and 180 rows of observations.



---



## Data Dictionary

          
Variable Name  | Variable Type - Class
------------ | -------------
Subject | Subject of the Study - Integer
Activity | Type of Activity performed - Factor with 6 Levels ("LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS")
TimeBodyAccMeanX | Time Body Acceleration Signal Mean for X direction -  Numeric
TimeBodyAccMeanY | Time Body Acceleration Signal Mean for Y direction -  Numeric
TimeBodyAccMeanZ | Time Body Acceleration Signal Mean for Z direction -  Numeric
TimeGravityAccMeanX | Time Gravity Acceleration Signal Mean for X direction -  Numeric
TimeGravityAccMeanY | Time Gravity Acceleration Signal Mean for Y direction -  Numeric
TimeGravityAccMeanZ | Time Gravity Acceleration Signal Mean for Z direction -  Numeric
TimeBodyAccJerkMeanX | Time Body Acceleration Jerk Signal Mean for X direction -  Numeric
TimeBodyAccJerkMeanY | Time Body Acceleration Jerk Signal Mean for Y direction -  Numeric
TimeBodyAccJerkMeanZ | Time Body Acceleration Jerk Signal Mean for Z direction -  Numeric
TimeBodyGyroMeanX | Time Body Acceleration Gyroscope Signal Mean for X direction -  Numeric
TimeBodyGyroMeanY | Time Body Acceleration Gyroscope Signal Mean for Y direction -  Numeric
TimeBodyGyroMeanZ | Time Body Acceleration Gyroscope Signal Mean for Z direction -  Numeric
TimeBodyGyroJerkMeanX | Time Body Acceleration Gyroscope Jerk Signal Mean for X direction -  Numeric
TimeBodyGyroJerkMeanY | Time Body Acceleration Gyroscope Jerk Signal Mean for Y direction -  Numeric
TimeBodyGyroJerkMeanZ | Time Body Acceleration Gyroscope Jerk Signal Mean for Z direction -  Numeric
TimeBodyAccMagMean | Time Body Acceleration Magnitudes Signal Mean -  Numeric
TimeGravityAccMagMean | Time Gravity Acceleration Magnitudes Signal Mean -  Numeric
TimeBodyAccJerkMagMean | Time Gravity Acceleration Jerk Magnitudes Signal Mean -  Numeric
TimeBodyGyroMagMean | Time Body Gyroscope Magnitude Signal Mean for X direction -  Numeric
TimeBodyGyroJerkMagMean | Time Body Gyroscope Jerk Magnitude Signal Mean for X direction -  Numeric
FreqBodyAccMeanX | Frequency Body Acceleration Signal Mean for X direction -  Numeric
FreqBodyAccMeanY | Frequency Body Acceleration Signal Mean forY direction -  Numeric
FreqBodyAccMeanZ | Frequency Body Acceleration Signal Mean for Z direction -  Numeric
FreqBodyAccJerkMeanX | Frequency Body Acceleration Jerk Signal Mean for X direction -  Numeric
FreqBodyAccJerkMeanY | Frequency Body Acceleration Jerk Signal Mean for Y direction -  Numeric
FreqBodyAccJerkMeanZ | Frequency Body Acceleration Jerk Signal Mean for Z direction -  Numeric
FreqBodyGyroMeanX | Frequency Body Gyroscope Signal Mean for X direction -  Numeric
FreqBodyGyroMeanY | Frequency Body Gyroscope Signal Mean for Y direction -  Numeric
FreqBodyGyroMeanZ | Frequency Body Gyroscope Signal Mean for Z direction -  Numeric
FreqBodyAccMagMean | Frequency Body Acceleration Magnitude Signal Mean -  Numeric
FreqBodyAccJerkMagMean | Frequency Body Acceleration Jerk Magnitude Signal Mean -  Numeric
FreqBodyGyroMagMean | Frequency Body Gyroscope Magnitude Signal Mean -  Numeric
FreqBodyGyroJerkMagMean | Frequency Body Gyroscope Jerk Magnitude Signal Mean -  Numeric
TimeBodyAccStdX | Time Body Acceleration Signal Standard Deviation for the X direction -  Numeric
TimeBodyAccStdY | Time Body Acceleration Signal Standard Deviation for the Y direction -  Numeric
TimeBodyAccStdZ | Time Body Acceleration Signal Standard Deviation for the Z direction -  Numeric
TimeGravityAccStdX | Time  Gravity Acceleration Signal Standard Deviation for the X direction -  Numeric
TimeGravityAccStdY | Time  Gravity Acceleration Signal Standard Deviation for the Y direction -  Numeric
TimeGravityAccStdZ | Time  Gravity Acceleration Signal Standard Deviation for the Z direction -  Numeric
TimeBodyAccJerkStdX | Time Body Acceleration Jerk Signal Standard Deviation for the X direction -  Numeric
TimeBodyAccJerkStdY | Time Body Acceleration Jerk Signal Standard Deviation for the Y direction -  Numeric
TimeBodyAccJerkStdZ | Time Body Acceleration Jerk Signal Standard Deviation for the Z direction -  Numeric
TimeBodyGyroStdX | Time Body Gyroscope Signal Standard Deviation for the X direction -  Numeric
TimeBodyGyroStdY | Time Body Gyroscope Signal Standard Deviation for the Y direction -  Numeric
TimeBodyGyroStdZ | Time Body Gyroscope Signal Standard Deviation for the Z direction -  Numeric
TimeBodyGyroJerkStdX | Time Body Gyroscope Jerk Signal Standard Deviation for the X direction -  Numeric
TimeBodyGyroJerkStdY | Time Body Gyroscope Jerk Signal Standard Deviation for the Y direction -  Numeric
TimeBodyGyroJerkStdZ | Time Body Gyroscope Jerk Signal Standard Deviation for the Z direction -  Numeric
TimeBodyAccMagStd | Time Body Acceleration Magnitude Signal Standard Deviation -  Numeric
TimeGravityAccMagStd | Time  Gravity Acceleration Magnitude Signal Standard Deviation -  Numeric
TimeBodyAccJerkMagStd | Time Body Acceleration Jerk Magnitude Signal Standard Deviation -  Numeric
TimeBodyGyroMagStd | Time Body Gyroscope Magnitude Signal Standard Deviation -  Numeric
TimeBodyGyroJerkMagStd | Time Body Gyroscope Jerk Magnitude Signal Standard Deviation -  Numeric
FreqBodyAccStdX | Frequency Body Acceleration Signal Standard Deviation for the X direction -  Numeric
FreqBodyAccStdY | Frequency Body Acceleration Signal Standard Deviation for the Y direction -  Numeric
FreqBodyAccStdZ | Frequency Body Acceleration Signal Standard Deviation for the Z direction -  Numeric
FreqBodyAccJerkStdX | Frequency Body Acceleration Jerk Signal Standard Deviation for the X direction -  Numeric
FreqBodyAccJerkStdY | Frequency Body Acceleration Jerk Signal Standard Deviation for the Y direction -  Numeric
FreqBodyAccJerkStdZ | Frequency Body Acceleration Jerk Signal Standard Deviation for the Z direction-  Numeric
FreqBodyGyroStdX | Frequency Body Gyroscope Signal Standard Deviation for the X direction -  Numeric
FreqBodyGyroStdY | Frequency Body Gyroscope Signal Standard Deviation for the Y direction -  Numeric
FreqBodyGyroStdZ | Frequency Body Gyroscope Signal Standard Deviation for the Z direction -  Numeric
FreqBodyAccMagStd | Frequency Body Acceleration Magnitude Signal Standard Deviation -  Numeric
FreqBodyAccJerkMagStd | Frequency Body Acceleration Jerk Magnitude Signal Standard Deviation -  Numeric
FreqBodyGyroMagStd | Frequency Body Gyroscope Magnitude Signal Standard Deviation -  Numeric
FreqBodyGyroJerkMagStd | Frequency Body Gyroscope Jerk Magnitude Signal Standard Deviation -  Numeric