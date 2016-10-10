library(dplyr)
library(reshape2)

## Return either the "training" or "test" dataset as a data frame.
## Each record in the dataset returned contains:
## - subject_id: (integer) identifying the subject who performed the activity
## - activity: (character) descriptive name; for example, "SITTING"
## - 66 variables representing the mean() and std() measurements for each
##   activities measured (as instructed for the Coursera course assignment).
get_activity_dataset <- function(dataDir, testOrTrain="train") {
    
    # Path to the training or test data
    testOrTrainDir <- paste(dataDir, testOrTrain, "/", sep = "")
    
    # Paths to the training/test data, subject identifiers and activity identifiers
    testOrTrainDataFile <- paste(testOrTrainDir, "X_", testOrTrain, ".txt", sep = "")
    subjectIdFile <- paste(testOrTrainDir, "subject_", testOrTrain, ".txt", sep = "")
    activityIdFile <- paste(testOrTrainDir, "y_", testOrTrain, ".txt", sep = "")

    # The variables we will extract for the Week 4 Project are enumerated in
    # the file, "assignment_varnames.txt". In this file:
    # - first column contains a column index into the training or test data set
    # - second column contains a descriptive variable name for the corresponding
    #   training or test data variable. These names were taken from the file,
    #   "features_info.txt" in the original data set.
    assignmentVarNamesFile <- paste("./", "assignment_varnames.txt", sep = "")
    assignmentVarNamesTbl <- read.delim(assignmentVarNamesFile, header = FALSE, sep = "", colClasses = "character")
    assignmentVarIndexes <- as.integer(assignmentVarNamesTbl[, 1])
    assignmentVarNames <- assignmentVarNamesTbl[, 2]

    # Read the training or test data, and then extract "the measurements on 
    # mean and standard deviation for each measurement", as specified in the
    # Week 4 Project assignment instructions.
    testOrTrainData <- read.delim(testOrTrainDataFile, header = FALSE, sep = "")
    testOrTrainData <- testOrTrainData[, assignmentVarIndexes]
    colnames(testOrTrainData) <- assignmentVarNames
    
    # Read the training subject identifiers and activity labels that correspond
    # to the training or test data.
    trainSubjectIds <- read.delim(subjectIdFile, header = FALSE, sep = "")
    colnames(trainSubjectIds) <- c("subject_id")
    trainLabelIds <- read.delim(activityIdFile, header = FALSE, sep = "")
    colnames(trainLabelIds) <- c("activity_id")
    
    # Add the activity labels
    testOrTrainData <- bind_cols(trainLabelIds, testOrTrainData)
    
    # Add the subject ids
    testOrTrainData <- bind_cols(trainSubjectIds, testOrTrainData)
    
    # Read the file that provides mapping of activity ids to descriptive
    # activity names.
    activityMappingsFile <- paste(dataDir, "activity_labels.txt", sep = "")
    activityMappings <- read.delim(activityMappingsFile, header = FALSE, sep = "", colClasses = "character")
    colnames(activityMappings) <- c("activity_id", "activity")
    
    # Replace the activity ids in our data set with descriptive activity labels.
    testOrTrainData <- mutate(testOrTrainData, activity_id = activityMappings[as.character(activity_id), 2])
    testOrTrainData <- rename(testOrTrainData, activity = activity_id)
    
    testOrTrainData
}

run_analysis <- function() {
    
    # Path to the data sets
    dataDir = "./UCI HAR Dataset/"
    
    # Get the test and training datasets.
    trainingDataset <- get_activity_dataset(dataDir, testOrTrain = "train")
    testingDataset <- get_activity_dataset(dataDir, testOrTrain = "test")

    # Combine the datasets.
    fullDataset <- bind_rows(trainingDataset, testingDataset)
    
    # Write the combined (test and training) dataset to file.
    write.csv(fullDataset, file = "full_activity_dataset.csv", row.names = FALSE)

    # Group the combined dataset by subject and activity.
    fullDataset <- tbl_df(fullDataset)
    fullDatasetGrouped <- group_by(fullDataset, subject_id, activity)
    
    # Create a second data set that contains the average (mean) of the 
    # measures included in the combined data set, for each subject and
    # activity.
    averagesDataset <- summarize_each(fullDatasetGrouped, funs(mean), 3:68)
    
    # Write the "averages" data set to file (include a csv as well as txt).
    write.csv(averagesDataset, file = "activity_averages_dataset.csv", row.names = FALSE)
    write.table(averagesDataset, file = "activity_averages_dataset.txt", row.names = FALSE)
}

