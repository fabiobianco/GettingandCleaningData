#########################################################################################################################################################
# The run_analysis scrip do:                                                                                                                            #        
# 1 - Merges the training and the test sets to create one data set.                                                                                     #       
# 2 - Extracts only the measurements on the mean and standard deviation for each measurement.                                                           #
# 3 - Uses descriptive activity names to name the activities in the data set                                                                            #
# 4 - Appropriately labels the data set with descriptive variable names.                                                                                #
# 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.    #
#########################################################################################################################################################
# 
#Charge the library needed for the script
#
library(data.table)
#
#####################################################################
# 1 - Merges the training and the test sets to create one data set. #
#####################################################################
#
# read the "activity_label file" and rename the columns
#
activity_labels <- read.table("~/GettingandCleaningData/activity_labels.txt", quote="\"")
activity_labels$V2 <- as.character(activity_labels$V2)
names(activity_labels)[1] <- "classlabel"
names(activity_labels)[2] <- "activityname"
#
#read the "features" file and rename the columns
features <- read.table("~/GettingandCleaningData/features.txt", quote="\"")
features$V2 <- as.character(features$V2)
names(features)[2] <- "varnum"
names(features)[2] <- "varname"
# 
# Read "train" data and create the first dataset
#
subject_train <- read.table("~/GettingandCleaningData/subject_train.txt", quote="\"")
X_train <- read.table("~/GettingandCleaningData/X_train.txt", quote="\"")
y_train <- read.table("~/GettingandCleaningData/y_train.txt", quote="\"")
# Assign names to columns
names(subject_train) <- "subject"
names(y_train) <- "classlabel"
# labels the data set with descriptive variable names
names(X_train) <- features[,2]
#
# create the "train" dataset
train_dataset <- cbind(subject_train, y_train, X_train)
#
# Read "test" data
subject_test <- read.table("~/GettingandCleaningData/subject_test.txt", quote="\"")
X_test <- read.table("~/GettingandCleaningData/X_test.txt", quote="\"")
y_test <- read.table("~/GettingandCleaningData/y_test.txt", quote="\"")
# Assign names to columns
names(subject_test) <- "subject"
names(y_test) <- "classlabel"
# labels the data set with descriptive variable names
names(X_test) <- features[,2]
#
# create the "test" dataset
test_dataset <- cbind(subject_test, y_test, X_test)
#
# Merges the training and the test sets to create one data set
#
HAR_dataset <- rbind(test_dataset, train_dataset)
###############################################################################################
# 2 - Extracts only the measurements on the mean and standard deviation for each measurement. #
# #############################################################################################
mean_sd_features <- grep("(mean|std)", features[, 2],ignore.case=T)
#
mean_sd_var <- c(1:86)
for (i in 1:86){
        mean_sd_var[i] <- features[,2][mean_sd_features[i]]
}
HAR_mean_sd_dataset <- cbind(HAR_dataset[,1:3],HAR_dataset[mean_sd_var])
#
##############################################################################
# 3 - Uses descriptive activity names to name the activities in the data set #
##############################################################################
#
HAR_dataset1 <- merge(activity_labels,HAR_mean_sd_dataset)
HAR_dataset1 <- HAR_dataset1[with(HAR_dataset1, order(subject, classlabel)), ]
# 
# Delete the "classlabel" column because have the same sense of "activityname" column, and rearrange the columns
#
HAR_dataset1 <- cbind(HAR_dataset1[,3],HAR_dataset1[,2],HAR_dataset1[,4:90])
names(HAR_dataset1)[1] <- "subject"
names(HAR_dataset1)[2] <- "activityname"
#
# Copy the dataset so 
HAR_dataset2 <- HAR_dataset1
#
###########################################################
# 4 - labels the data set with descriptive variable names #
###########################################################
#
# just made before when I cread the training and test data set!
#
#######################################################################################################################
# 5 - creates a second, independent tidy dataset with the average of each variable for each activity and each subject #
#######################################################################################################################
#
# create a list by splitting the dataset by "subject" 
#
HAR_final <- split(HAR_dataset2, HAR_dataset2$subject)
#
# For every single subject calculate the mean by activity name
#
HAR_dataset3 <- data.frame()
for (i in 1:30){
        dataset_temp <- as.data.table(HAR_final[[i]])
        dataset_temp <- dataset_temp[, lapply(.SD, mean), by = activityname]
        HAR_dataset3 <- rbind(HAR_dataset3,dataset_temp)
        # cleat the "temp" dataset!
        rm(dataset_temp)
}
#
# Write run_analisys_dataset.txt file 
#
write.table(HAR_dataset3, file = "runanalisys_dataset.txt",row.names=FALSE, sep="\t")
#
