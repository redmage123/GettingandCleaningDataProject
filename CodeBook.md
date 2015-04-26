# GettingandCleaningDataProject
Course Project for Getting and Cleaning Data

## Description
This Codebook describes the variables, data and data transformations
used in this project.

## Source Data
The source data descriptions are located here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data itself can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## Data description

The experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed six
activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,
STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
waist. Using its embedded accelerometer and gyroscope, we captured
3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz. The experiments have been video-recorded to label the data
manually. The obtained dataset has been randomly partitioned into two
sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor
acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency
was used. From each window, a vector of features was obtained by
calculating variables from the time and frequency domain.

## Section 1. Merge the training and the test sets to create one data set.

After setting the source directory for the files, read into tables the
data located in

features.txt
activity_labels.txt
subject_train.txt
x_train.txt
y_train.txt
subject_test.txt
x_test.txt
y_test.txt

Merge all of the train data and test data for x,y, and subject.
Assign column names using data from the features.txt file.

Section 2. Extract only the measurements on the mean and standard
deviation for each measurement.

Search for all fields in feature names that have the string "mean" or
"std" in the name. Select those fields as well as the "subject" and 
"activity" names.  Then subset the merged data to find only those
fields with those strings.


## Section 3. Use descriptive activity names to name the activities in the
data set

Create a factor variable in the finalData dataframe called "activity"
and set the levels according to the data in the activity_feature.txt
file
 
Section 4. Appropriately label the data set with descriptive activity
names.

Use gsub function for pattern replacement to clean up the data labels.
Ex. changing "Acc" to Accelerometer" and "Gyro" to Gyroscope

Section 5. Create a second, independent tidy data set with the average
of each variable for each activity and each subject.

Aggregate the new tidyData dataset with  the mean of subject, and activity 
in the finalData dataset and order it by subject and activity
Finally, write this data out to a file called "tidydata.txt"

