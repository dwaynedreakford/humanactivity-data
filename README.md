# humanactivity-data
This repository contains important files for the final project for Coursera course, "Getting and Cleaning Data". The files in this repository are used to collect, manipulate and clean data from the data provided for the "Human Activity Recognition Using Smartphones Dataset" project, located at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Source Data
The source data for this project is provided here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Important files from the source data reposotory are included here for easy reference, and because the code book in this reposotory references measurements that are fully described in these source data descriptive files. The following files have been included from the source data set at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip :
* README.txt
* features_info.txt
* features.txt
* activity_labels.txt

### Other Input Files
Descriptive variable names for the measures taken for the source data sets are included in the file, _assignment_varnames.txt_. 
This file's contents:
    * first column contains a column index into the training or test data set
    * second column contains a descriptive variable name for the corresponding training or test data variable. These names were taken from the file, _features_info.txt_, which is included in the original data set.

### Analysis Scripts
This repository contains a single R script, _run_analysis.R_, which is used to process the data. This script
1. Reads the "training" and "test" data sets.
   * The measurement data contained in these data sets are provided in separate txt files from files that contain the subject and activity identifers associated with each record of measurement data.
2. Reconstructs complete the full data set records, so that each records contains:
   * subject identifier
   * descriptive activity name
   * descriptively named measurement variables (only the mean() and std() measurements are retained for our dataset)
3. Creates a second data set that contains the averages of each measurement that is retained in the data set created by step 2, for each subject and activity.
4. Writes both resulting data sets, from steps 2 and 3, to separate comma-separated (csv) files.
