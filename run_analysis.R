# The run_analysis scrip do:
# 1 - Merges the training and the test sets to create one data set.
# 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3 - Uses descriptive activity names to name the activities in the data set
# 4 - Appropriately labels the data set with descriptive variable names. 
# 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#

# 1 - Merges the training and the test sets to create one data set.
#
activity_labels <- read.table("~/GettingandCleaningData/UCI HAR Dataset/activity_labels.txt", quote="\"")
activity_labels$V2 <- as.character(activity_labels$V2)
names(activity_labels)[1] <- "CLASS LABEL"
names(activity_labels)[2] <- "ACTIVITY NAME"
#
features <- read.table("~/GettingandCleaningData/UCI HAR Dataset/features.txt", quote="\"")
features$V2 <- as.character(features$V2)
#
# Read the two datasets (training and test one)
# 
# Read "train" data
subject_train <- read.table("~/GettingandCleaningData/UCI HAR Dataset/train/subject_train.txt", quote="\"")
X_train <- read.table("~/GettingandCleaningData/UCI HAR Dataset/train/X_train.txt", quote="\"")
y_train <- read.table("~/GettingandCleaningData/UCI HAR Dataset/train/y_train.txt", quote="\"")
# Assign names to columns
names(subject_train) <- "SUBJECT"
names(y_train) <- "CLASS LABEL"
names(X_train) <- features[,2]
#
# Read "test" data
subject_test <- read.table("~/GettingandCleaningData/UCI HAR Dataset/test/subject_test.txt", quote="\"")
X_test <- read.table("~/GettingandCleaningData/UCI HAR Dataset/test/X_test.txt", quote="\"")
y_test <- read.table("~/GettingandCleaningData/UCI HAR Dataset/test/y_test.txt", quote="\"")
# Assign names to columns
names(subject_test) <- "SUBJECT"
names(y_test) <- "CLASS LABEL"
names(X_test) <- features[,2]
#
# Merge the training and test dataset
#
test_dataset <- cbind(subject_test, y_test, X_test)
train_dataset <- cbind(subject_train, y_train, X_train)
HAR_dataset <- rbind(test_dataset, train_dataset)
#
HAR_dataset <- merge(activity_labels,HAR_dataset)
#
# 2 - 
# 3 -
# 4 -
#
# 5 - 
