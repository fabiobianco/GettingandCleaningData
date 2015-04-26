## Getting and Cleaning Data Project Assignement

This is the result of Project assignement on Getting and Cleaning Data course. Below you can read information about:  

1. **The raw data** used for the assignement 
2. **The tidy data set** obtained with *run_analisys.R* script
3. **The code book** that describing each variable and its values in the tidy data set

##The raw data
For the project assignement were used raw data from the **Machine Learning Repository**,  the source was *"Human Activity Recognition Using Smartphones Data Set"*  [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

##The tidy data set
To build the final tidy  dataset were made the following logical steps:

1. Download data from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
2. Read single files from R working directory 
3. Create test and traininig data sets
4. Merges the training and the test data sets to create one data set
5. Extracts only the measurements on the mean and standard deviation for each measurement in the data set
6. Uses descriptive activity names to name the activities in the data set
7. Appropriately labels the data set with descriptive variable names
8. Creates a second, independent tidy data set with the average of each variable for each activity and each subject

All logical steps was made by the *run_analisis.R* script, available on this repository.

##The code book

The file CodeBook.md in this repository contain:

1. Information about the variables in the data set 
2. Information about choice made on data manipolation 
3. Information about the experimental study design that generated the raw data