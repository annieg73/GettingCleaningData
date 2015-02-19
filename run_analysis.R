# read all the necessary files, 
# with the the assumption that the Samsung data 
# are available in the working directory in an unzipped UCI HAR Dataset folder:
library(data.table)
subject_test <- read.table("UCI HAR Dataset/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/X_test.txt")
Y_test <- read.table("UCI HAR Dataset/Y_test.txt")
subject_train <- read.table("UCI HAR Dataset/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/X_train.txt")
Y_train <- read.table("UCI HAR Dataset/Y_train.txt")
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

#rename the colums
names(X_test) <- features$V2
names(X_train) <- features$V2
names(Y_test) <- c("Activity")
names(Y_train) <- c("Activity")
names(subject_test) <- c("Subject")
names(subject_train) <- c("Subject")


# merge all the data to create a dataset
test_data <- cbind(subject_test,X_test,Y_test)
train_data <- cbind(subject_train,X_train,Y_train)
tot_data <- rbind(test_data,train_data)

# select only the relevant columns (taking only the mean() and std() )
mean_col <- grep(pattern = "mean()", features$V2, value = TRUE,fixed=TRUE) 
stdev_col <- grep(pattern = "std()", features$V2, value = TRUE,fixed=TRUE) 
tot_col <- c("Subject","Activity",mean_col,stdev_col)
data2 <- tot_data[,tot_col]

# Assign activity names 
data2$Activity <- factor(data2$Activity,
                          levels = c(1:6),
                          labels = activity_labels$V2)
# Correct value names
levels(data2$Activity)[6] <- 'LYING'

# Correct Variable Names 
names(data2) <- gsub("\\(","",gsub("\\)","",gsub("fBody","FreqBody",
                            gsub("tBody","TimeBody",gsub("tGravity","TimeGravity",gsub("BodyBody","Body",
                            gsub("-","",gsub("mean","Mean",gsub("std","Std",tot_col)))))))))


# Create the second tidy dataset with the average of each variable by subject and by activity
library(plyr)
data3 <- ddply(data2,.(Subject,Activity),function(x) {
                                              colMeans(x[,c(3:68)])
                                              }
              )

# Export the dataset in a txt format
write.table(data3,"UCI HAR Dataset/tidy_data.txt", sep =" ",row.names=FALSE)

# to visualize data in R
tidy_data <- read.table("UCI HAR Dataset/tidy_data.txt", header = TRUE) 
View(tidy_data)

# the following lines of code can be used to transform the wide tidy_data into a long narrow datasets 
# library(tidyr)
# library(dplyr)
# data_long <- tidy_data %>% gather(features,measure,-subject,-activity)
# View(data_long)
