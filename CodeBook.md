

### CODE BOOK - Getting and cleaning data assignment (R-script: run_analysis.R)

CODE BOOK - tidy_smartphone_data.txt

Feature Selection for the tidy dataset

The features selected for this data frame came from the transformation of the data in the "Human Activity Recognition Using Smartphones Dataset Version 1.0".

The data were gleaned by having 30 volunteers (ages 19-48) wear a smartphone (Samsung Galaxy S II) and perform six activities:

WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

The built-in accelerometer and gyroscope were used to capture a 3-axial angular velocity at a constant rate of 50Hz (raw signals: tAcc-XYZ, tGyro-XYZ).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ tGravityAcc-XYZ tBodyAccJerk-XYZ tBodyGyro-XYZ tBodyGyroJerk-XYZ tBodyAccMag tGravityAccMag 
tBodyAccJerkMag tBodyGyroMag tBodyGyroJerkMag fBodyAcc-XYZ fBodyAccJerk-XYZ 
fBodyGyro-XYZ fBodyAccMag fBodyAccJerkMag fBodyGyroMag fBodyGyroJerkMag

angle(): Angle between two vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean tBodyAccMean tBodyAccJerkMean tBodyGyroMean tBodyGyroJerkMean

## Variables in the tidy dataset:

mean() : mean values of multiple measurements of the original variables. Type: Real number

std(): Standard deviation of multiple measurements of the original variables. Type: Real number

activity_id: Identifier, identifying the activity of each subject Type: Integer Values: 1 : 6

activity_name: Descriptive name of each subject's activity Type: Factor Values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

subject_id : Identifier, identifying each subject Type: Integer Values: 1 : 30