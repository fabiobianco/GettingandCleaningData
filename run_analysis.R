# The run_analysis scrip do:
# 1 - Merges the training and the test sets to create one data set.
# 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3 - Uses descriptive activity names to name the activities in the data set
# 4 - Appropriately labels the data set with descriptive variable names. 
# 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#

# 1 - Merges the training and the test sets to create one data set.

# Read the two datasets (training and test one)
# 
# Read "train" data
X_train <- read.table("~/GettingandCleaningData/UCI HAR Dataset/train/X_train.txt", quote="\"")
y_train <- read.table("~/GettingandCleaningData/UCI HAR Dataset/train/y_train.txt", quote="\"")
#
# Read "test" data
X_test <- read.table("~/GettingandCleaningData/UCI HAR Dataset/test/X_test.txt", quote="\"")
y_test <- read.table("~/GettingandCleaningData/UCI HAR Dataset/test/y_test.txt", quote="\"")
#
# Merge the training and test dataset
#
test_dataset <- cbind(subject_test, y_test, X_test)
train_dataset <- cbind(subject_train, y_train, X_train)
HAR_dataset <- rbind(test_dataset, train_dataset)

#
# 2 - 