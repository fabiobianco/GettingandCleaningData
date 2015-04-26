# Code Book for *runanalisys* dataset

This is the CodeBook for the **runanalisys** tiny dataset creared with the *run_analysis.R* script

# Information about the experimental study design that generated the raw data 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

# Information about choice made on data manipolation
The *run_analysis.R* script performs the following steps to clean the data:  

1. Read activity_labels.txt file from the working directory and store in *activity_labels*
2. Read features.txt file from the working directory and store in *features*
3. Read X_train.txt, y_train.txt and subject_train.txt from the working directory, merge and store in *train_dataset*
4. Read X_test.txt, y_test.txt and subject_test.txt from the working directory, merge and store in *test_dataset*
5. Merges the training and the test sets to create one data set named *HAR_dataset*
```
HAR_dataset <- rbind(test_dataset, train_dataset)
```
6. Extracts only the measurements on the mean and standard deviation for each measurement in the dataset  
**We consider only variables in features file that contain the "mean" or "std" words in her name**
```
mean_sd_features <- grep("(mean|std)", features[, 2],ignore.case=T)
```
7. Uses descriptive activity names to name the activities in the data set
```
HAR_dataset1 <- merge(activity_labels,HAR_mean_sd_dataset)
```
8. labels the data set with descriptive variable names  
change "-" with ".", "t" with "time", "f" with "frequency" and remove "()" from name variables
```
#
new_labels <- gsub("-", ".", names(HAR_dataset2))
# insert "time" for t variables
new_labels <- gsub("\\bt", "time", new_labels)
# insert "frequency" for f variables
new_labels <- gsub("\\bf", "frequency", new_labels)
# remove parenthesis from names
new_labels <- sub("\\(\\)","", new_labels)
#
```
9. creates a second, independent tidy dataset with the average of each variable for each activity and each subject
```
HAR_list <- split(HAR_dataset4, HAR_dataset4$subject)
#
HAR_dataset5 <- data.frame()
for (i in 1:30){
        dataset_temp <- as.data.table(HAR_list[[i]])
        dataset_temp <- dataset_temp[, lapply(.SD, mean), by = activityname]
        HAR_dataset5 <- rbind(HAR_dataset5,dataset_temp)
        rm(dataset_temp)
}
```
10. create the runanalisys.txt dataset file
```
write.table(HAR_dataset5 , "runanalisys.txt", sep="\t")
```
# Information about the variables in the data set
describes each variable and its units.

**Legend:**

* time            --> signal in time domain
* frequency       --> signal in frequencity domani
* acc             --> signal from accelerometer 
* gyro            --> signal from gyroscope
* std             --> standard deviation
* Mag             --> Signal Magnitude 

Variables in dataset:

1. *subject* - volunteers identifier, possible value from 1 to 30        
2. *activityname* - type of activity: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
3. timeBodyAcc.mean.X 
4. timeBodyAcc.mean.Y 
5. timeBodyAcc.mean.Z 
6. timeBodyAcc.std.X 
7. timeBodyAcc.std.Y 
8. timeBodyAcc.std.Z 
9. timeGravityAcc.mean.X 
10. timeGravityAcc.mean.Y 
11. timeGravityAcc.mean.Z 
12. timeGravityAcc.std.X 
13. timeGravityAcc.std.Y 
14. timeGravityAcc.std.Z 
15. timeBodyAccJerk.mean.X
16. timeBodyAccJerk.mean.Y
17. timeBodyAccJerk.mean.Z
18. timeBodyAccJerk.std.X
19. timeBodyAccJerk.std.Y
20. timeBodyAccJerk.std.Z
21. timeBodyGyro.mean.X
22. timeBodyGyro.mean.Y
23. timeBodyGyro.mean.Z
24. timeBodyGyro.std.X
25. timeBodyGyro.std.Y
26. timeBodyGyro.std.Z
27. timeBodyGyroJerk.mean.X
28. timeBodyGyroJerk.mean.Y
29. timeBodyGyroJerk.mean.Z
30. timeBodyGyroJerk.std.X
31. timeBodyGyroJerk.std.Y
32. timeBodyGyroJerk.std.Z
33. timeBodyAccMag.mean
34. timeBodyAccMag.std
35. timeGravityAccMag.mean
36. timeGravityAccMag.std
37. timeBodyAccJerkMag.mean
38. timeBodyAccJerkMag.std
39. timeBodyGyroMag.mean
40. timeBodyGyroMag.std
41. timeBodyGyroJerkMag.mean
42. timeBodyGyroJerkMag.std
43. frequencyBodyAcc.mean.X
44. frequencyBodyAcc.mean.Y
45. frequencyBodyAcc.mean.Z     
46. frequencyBodyAcc.std.X
47. frequencyBodyAcc.std.Y
48. frequencyBodyAcc.std.Z
49. frequencyBodyAcc.meanFreq.X
50. frequencyBodyAcc.meanFreq.Y
51. frequencyBodyAcc.meanFreq.Z
52. frequencyBodyAccJerk.mean.X
53. frequencyBodyAccJerk.mean.Y
54. frequencyBodyAccJerk.mean.Z
55. frequencyBodyAccJerk.std.X
56. frequencyBodyAccJerk.std.Y
57. frequencyBodyAccJerk.std.Z
58. frequencyBodyAccJerk.meanFreq.X
59. frequencyBodyAccJerk.meanFreq.Y
60. frequencyBodyAccJerk.meanFreq.Z
61. frequencyBodyGyro.mean.X
62. frequencyBodyGyro.mean.Y
63. frequencyBodyGyro.mean.Z
64. frequencyBodyGyro.std.X
65. frequencyBodyGyro.std.Y
66. frequencyBodyGyro.std.Z
67. frequencyBodyGyro.meanFreq.X
68. frequencyBodyGyro.meanFreq.Y
69. frequencyBodyGyro.meanFreq.Z
70. frequencyBodyAccMag.mean
71. frequencyBodyAccMag.std
72. frequencyBodyAccMag.meanFreq
73. frequencyBodyBodyAccJerkMag.mean
74. frequencyBodyBodyAccJerkMag.std
75. frequencyBodyBodyAccJerkMag.meanFreq
76. frequencyBodyBodyGyroMag.mean
77. frequencyBodyBodyGyroMag.std
78. frequencyBodyBodyGyroMag.meanFreq
79. frequencyBodyBodyGyroJerkMag.mean
80. frequencyBodyBodyGyroJerkMag.std
81. frequencyBodyBodyGyroJerkMag.meanFreq
82. angle(timeBodyAccMean,gravity)
83. angle(timeBodyAccJerkMean),gravityMean)
84. angle(timeBodyGyroMean,gravityMean)
85. angle(timeBodyGyroJerkMean,gravityMean)
86. angle(X,gravityMean)
87. angle(Y,gravityMean)
88. angle(Z,gravityMean)
