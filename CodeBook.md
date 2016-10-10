#CodeBook

The script, _run_analysis.R_ results in two files containing data based on the original data set provided for the "Human Activity Recognition Using Smartphones Dataset" project, located at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

### Data files resulting from the analysis performded by _run_analysis.R_:

#### full_activity_dataset.csv
This is the combined training and test data sets described in _README.txt_, fully reconstructed such that each record includes:
* subject_id - identifies the subject who performed the activity
* activity - descriptive activity name (e.g., RUNNING)
* The following measurement variables (only the measurements on the mean and standard deviation for each measurement are included in this dataset):
  * tBodyAcc-mean()-X
  * tBodyAcc-mean()-Y
  * tBodyAcc-mean()-Z
  * tBodyAcc-std()-X
  * tBodyAcc-std()-Y
  * tBodyAcc-std()-Z
  * tGravityAcc-mean()-X
  * tGravityAcc-mean()-Y
  * tGravityAcc-mean()-Z
  * tGravityAcc-std()-X
  * tGravityAcc-std()-Y
  * tGravityAcc-std()-Z
  * tBodyAccJerk-mean()-X
  * tBodyAccJerk-mean()-Y
  * tBodyAccJerk-mean()-Z
  * tBodyAccJerk-std()-X
  * tBodyAccJerk-std()-Y
  * tBodyAccJerk-std()-Z
  * tBodyGyro-mean()-X
  * tBodyGyro-mean()-Y
  * tBodyGyro-mean()-Z
  * tBodyGyro-std()-X
  * tBodyGyro-std()-Y
  * tBodyGyro-std()-Z
  * tBodyGyroJerk-mean()-X
  * tBodyGyroJerk-mean()-Y
  * tBodyGyroJerk-mean()-Z
  * tBodyGyroJerk-std()-X
  * tBodyGyroJerk-std()-Y
  * tBodyGyroJerk-std()-Z
  * tBodyAccMag-mean()
  * tBodyAccMag-std()
  * tGravityAccMag-mean()
  * tGravityAccMag-std()
  * tBodyAccJerkMag-mean()
  * tBodyAccJerkMag-std()
  * tBodyGyroMag-mean()
  * tBodyGyroMag-std()
  * tBodyGyroJerkMag-mean()
  * tBodyGyroJerkMag-std()
  * fBodyAcc-mean()-X
  * fBodyAcc-mean()-Y
  * fBodyAcc-mean()-Z
  * fBodyAcc-std()-X
  * fBodyAcc-std()-Y
  * fBodyAcc-std()-Z
  * fBodyAccJerk-mean()-X
  * fBodyAccJerk-mean()-Y
  * fBodyAccJerk-mean()-Z
  * fBodyAccJerk-std()-X
  * fBodyAccJerk-std()-Y
  * fBodyAccJerk-std()-Z
  * fBodyGyro-mean()-X
  * fBodyGyro-mean()-Y
  * fBodyGyro-mean()-Z
  * fBodyGyro-std()-X
  * fBodyGyro-std()-Y
  * fBodyGyro-std()-Z
  * fBodyAccMag-mean()
  * fBodyAccMag-std()
  * fBodyBodyAccJerkMag-mean()
  * fBodyBodyAccJerkMag-std()
  * fBodyBodyGyroMag-mean()
  * fBodyBodyGyroMag-std()
  * fBodyBodyGyroJerkMag-mean()
  * fBodyBodyGyroJerkMag-std()

#### activity_averages_dataset.csv
This dataset contains the averages of each measurement, for each activity and subject, contained in _full_activity_dataset.csv_

Each record includes:
* subject_id - identifies the subject who performed the activity
* activity - descriptive activity name (e.g., RUNNING)
* The average (mean) calculated for each measurement variable included in _full_activity_dataset.csv_




