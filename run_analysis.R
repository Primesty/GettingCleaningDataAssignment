
#### Coursera - Getting and Cleaning Data - Assignment ####

## This script merges data from a number of .txt files, produces a tidy dataset accordiing to the tidy
# data convention, and thus prepares the data for further analysis.

### STAGE I ### > We have to read in the necessary .txt files
 
## Read in activities and their names, and create variable names
activity_labels <- read.table("./activity_labels.txt",col.names=c("activity_id","activity_name"))
 
## Read in column (variable) names for the dataframe
 
features <- read.table("./features.txt")
 
# Provide feature names
 
feature_names <- features[,2]
 
## Read in test data and label dataframe's columns
 
test_data <- read.table("./test/X_test.txt"); names(test_data) <- feature_names # alternative colnames()
 
## Read in training data and label dataframe's columns
 
train_data <- read.table("./train/X_train.txt"); names(train_data) <- feature_names
 
## Read in ids of the test subjects and label the the dataframe's columns
test_subject_id <- read.table("./test/subject_test.txt"); names(test_subject_id) <- "subject_id"
 
## Read in activity id's of the test data and label the the dataframe's columns
test_activity_id <- read.table("./test/y_test.txt"); names(test_activity_id) <- "activity_id"
 
## Read in ids of the train subjects and label the the dataframe's columns
train_subject_id <- read.table("./train/subject_train.txt"); names(train_subject_id) <- "subject_id"
 
## Read in activity id's of the training data and label the dataframe's columns
train_activity_id <- read.table("./train/y_train.txt"); names(train_activity_id) <- "activity_id"
 
### STAGE II ### We now start building a combinded, tidy dataframe from the files we have read in
 
## First, we combine all the test data items (test_subject_id, test_activity_id, test_data)
 
test_data <- cbind(test_subject_id, test_activity_id, test_data)
 
## Now, we do the same for the training data set; train_subject_id, train_activity_id, train_data
 
train_data <- cbind(train_subject_id, train_activity_id, train_data)
 
## We now comine the test and training data
 
data_combined <- rbind(train_data, test_data)
 
## Extract only those columns that refer to the mean() and sd()

names(data_combined) <- tolower(names(data_combined))

## Keep only columns refering to mean() or sd() values
mean_col_index <- grep("mean",names(data_combined)) # we could also have used ignore.case = TRUE
mean_col_names <- names(data_combined)[mean_col_idx]
sd_col_index <- grep("std",names(data_combined))
sd_col_names <- names(data_combined)[sd_col_idx]
data_mean_sd <-data_combined[,c("subject_id","activity_id",mean_col_names,sd_col_names)]
 
## Merge the activities dataset with the mean/sd values dataset to get descriptive activity names

descr_act_names <- merge(activity_labels,data_mean_sd,by.x="activity_id",by.y="activity_id",all=TRUE)

## Melt the dataset with the descriptive activity names for better handling

library(reshape2)

data_melt <- melt(descr_act_names,id=c("activity_id","activity_name","subject_id"))
 
## Cast the melted dataset according to the average of each variable for each activity and each subject

mean_data <- dcast(data_melt,activity_id + activity_name + subject_id ~ variable,mean)

### STAGE III ### "Export" tidy dataset

## Create a file with the new tidy dataset

write.table(mean_data,"./tidy_smartphone_activity_data.txt", row.names = FALSE)
