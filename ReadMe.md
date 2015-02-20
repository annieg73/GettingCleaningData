# Getting and Cleaning Data Project
This Project is for the Coursera course "Getting and Cleaning Data" part of the Data Science Specialization provided by the Johns Hopking University.

---
---

## Files in this Repository

* run_analysis.R is the main program that reads the test and training data

* CodeBook.md explains all the variables and the transformations on the different variables.

* Readme.md explains in details the script run_analysis.R

* tidy_data is the tidy dataset


## Course Project

The aim of the project is to create one R script called run_analysis.R that does the following: 

1.  Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


---

---

## Course Project Detailed Descriptions

### Premise
The data for the project are available at this address: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This script starts with the assumption that the Samsung data has been saved in the working directory in an unzipped UCI HAR Dataset folder. 

*To set the working directory use the command setwd()*

The datasets used for the analysis are:

* 'features.txt': List of all features (561 obs. of 2 variables)
* 'activity_labels.txt': Links the class labels with their activity name (6 obs. of 2 variables)
* 'train/X_train.txt': Training set (7352 obs. of 1 variable)
* 'train/y_train.txt': Training labels (7352 obs. of 1 variable)
* 'test/X_test.txt': Test set (2947 obs. of 561 variables)
* 'test/y_test.txt': Test labels (2947 obs. of 1 variable)

*The inertia datasets haven't been used for this analysis.*

### Steps 

---

#### 1. Read all the necessary files and store the contents in corresponding datasets

*To perform this action the data.table package is required.*

*The function used to read the tables is read.table.*

---


#### 2. Rename the columns

The datasets'columns have been renamed in order to avoid duplicates in columns'name after performing the merging.

*The function used to rename the columns is names()*

* For the X_test and X_train the columns name have been acquired from the features dataset

* The variable name "activity" has been used for the Y_test and Y_train datasets

* The variable name "subject" has been used for the subject_test and subject_train datasets


---

#### 3. Merges all the datasets to create one dataset - *Point 1*

* A first dataset (test_data) containing all the test data is created through the cbind function binding the subject_test, X_test and Y_test datasets (2947 obs. of 563 variables).

* A second dataset (train_data) containing all the train data is created through the cbind function binding the subject_train, X_train and Y_train datasets (7352 observations of 563 variables).

* Finally the tot_data dataset is created through the rbind function binding the test_data and the train_data datasets (10299 obs. of 563 variables).

---


#### 4. Select only the measurements on the mean and standard deviation for each measurement - *Point 2*

The second point of the assignment requires to extract only the measurements on the mean and standard deviation for each measurement. 
On this purpose the relevant columns considered in this analysis are only those ending with mean() and std(). The decision to exclude the others including the meanFreq() is due to the description of the features_info file because they are described as weighted average of the frequency components to obtain a mean frequency. The results is 33 columns of mean functions that also matches the number of standard deviations columns.

The function used to extract the relavant columnsis the grep. 

* Use of grep to extract all the variables names containg mean()  (33 columns).

* Use of grep to extract all the variables names containg std()  (33 columns).

* A total list of all the column names is is created (row)binding all the mean variables names, std variables names and adding also subject and activity variables - 68 columns.

* The total list of column names is used to select the relevant columns from the dataset (10299 obs. of 68 variables).


---

#### 5. Assign Activity Names - *Point 3*

The activity names are included in the activity_labels dataset and are assigned to the activity column of the dataset using the factor() function.
The "LAYING" factor has been changed into "LYING" to be consistent with the English grammar.
See forum post:
https://class.coursera.org/getdata-011/forum/thread?thread_id=111


---

#### 6. Labels the dataset with descriptive variable names - *Point 4*

The variables have been renamed to Camel Cases and some errors in the original features have been corrected because that may help to see the data more tidy.
See forum post:
https://class.coursera.org/getdata-011/forum/thread?thread_id=69#comment-729

* Apply the Camel Cases rule (writing all the initials as capital letter)

* Remove the parenthesis "(" and ")"

* Correct the "BodyBody" in "Body"

* Change the initial "t" in "Time" and the initial "f" in "Freq"

---

#### 7. Create the tidy data set - *Point 5*

*To perform this action the package plyr is required.*

The second tidy dataset with the average of each variable by subject and by activity is created using the ddply function, and applying the ColMeans function.

The result is a wide tidy dataset,(the wide form has been seleceted because of the majority of people in the course opted for that).

See post:
https://class.coursera.org/getdata-011/forum/thread?thread_id=69#comment-718

The resulting dataset contains 180 obs. (corresponding a 6 activities x 30 subjects) and 68 variables (1 subject + 1 activity + 33 columns of means + 33 columns of standard deviations). 


However, to transform it into a tidy long form, a few lines of code have been added to the R script (as comment).


---

#### 8. Export the dataset as a .txt file
The write.table function has been used to export the file

---

#### 9. How visualize data in R
The last step allows to create a dataset using the rea.table functions and then view() command.


---

#### 10. Optional: transform the dataset into a long narrow dataset

A few lines of code added as comment allow to transform the dataset from a wide format to the long narrow tidy dataset (removing the # sign and run them). The result is a datset of 11880 obs and 4 variables.

*To perform this action the package dplyr and tidyr are required.*

A very useful post that has guided through the analysis is the following:

https://class.coursera.org/getdata-011/forum/thread?thread_id=69

