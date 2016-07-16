

### READ ME - Getting and cleaning data assignment (R-script: run_analysis.R)


Human Activity Recognition Using Smartphones Dataset


The run_analysis.R script reads data from the "Human Activity Recognition Using Smartphones Dataset Version 1.0" 
and produces a tidy dataset, which can then be used for further analysis.

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Short description of the data:

The data in the "Human Activity Recognition Using Smartphones Dataset Version 1.0" were produced by
a group of 30 volunteers (ages 19 - 48).

Each person performed six activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
wearing a smartphone (Samsung Galaxy S II) on the waist. 

The original dataset included the following data files:

'features.txt': List of all features.

'activity_labels.txt': List of class labels and their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'train/subject_train.txt': ID's of subjects in the training data

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

'test/subject_test.txt': ID's of subjects in the training data


Description of the run_analysis.R script:

The run_analysis.R script merges data from a number of .txt files and produces a tidy data set which may be used for further analysis.

1 - reads in required .txt files and labels the datasets

2 - "activity_id"'s and "subject_id"'s are appended to the "test" and the "training" data, which are then combined into one single data frame

3 - using the "grep" function, all the columns with mean() and std() values are extracted and then a new data frame, including only the "activity_id", the "subject_id" and the mean() and std() columns, is created

4 - using the "merge" function, descriptive activity names are merged with the mean/std values dataset, to get one dataset with descriptive activity names

5 - with the "melt" and "dcast" functions of the "reshape2" package, the data is converted into a table containing mean values of all the included features, ordered by the activity name and the subject id, and the data is written to the "tidy_smartphone_activity_data.txt" file.

A description of the "tidy_smartphone_activity_data.txt" file can be found in the "CodeBook.md" file.


