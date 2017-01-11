#Getting and Cleaning Data Final Project

Prashant Duhoon

####Information about the variables used, data set and cleaning transformations in the final course project for the Johns Hopkin's Getting and Cleaning Data course as a part of Data Science Specialization.

## Source Data set
Full Description of the data set used can be found at: [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The actual dataset be at: [Data set for project here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


## Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute Information
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Q1. Merge the training and the test sets to create one data set.
After setting the working directory for the files, read data from below files to respective variables:
- features.txt to feat
- activity_labels.txt to labels
- subject_train.txt to sub_train
- x_train.txt to x_train
- y_train.txt to y_train
- subject_test.txt to sub_test
- x_test.txt to x_test
- y_test.txt to y_test
We use second column in feat to assign column names to both x_train and x_test.
We also append y_train and sub_train to x_train and y_test and sub_test to x_test for Q3

## Q2. Extract only the measurements on the mean and standard deviation for each measurement. 
A logical vector (selcol) is created that contains TRUE values for the ID, mean and stdev columns and FALSE values for the others.

## Q3. Use descriptive activity names to name the activities in the data set
Merge data subset with the activityType table to include the activity names

## Q4. Appropriately label the data set with descriptive activity names.
Used gsub function for pattern replacement to clean up the data labels.

## Q5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
We have produced only a data set with the average of each veriable for each activity and subject
