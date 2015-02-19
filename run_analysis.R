# dont print any warning messages 
library(reshape2, warn.conflicts = FALSE)
library(dplyr, warn.conflicts = FALSE)


# assume that data dir "UCI HAR Dataset" is present
# in the same place as this file - run_analysis.R
if (!file.exists("./UCI HAR Dataset")) {
    
    print("Data folder not in the same dir as this R script")
    
} else {
    
    # If the top level data directory exists we assume that everything
    # underneath is in place. Read the data sets
    # I have ignored the data in the Inertial Signals directory
    # as suggested in David's course project FAQ
    # https://class.coursera.org/getdata-011/forum/thread?thread_id=69

    print("Reading data sets in train and test directories")
    subject_test_data <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    x_test_data <- read.table("./UCI HAR Dataset/test/x_test.txt")
    y_test_data <- read.table("./UCI HAR Dataset/test/y_test.txt")
                 
    subject_train_data <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    x_train_data <- read.table("./UCI HAR Dataset/train/x_train.txt")
    y_train_data <- read.table("./UCI HAR Dataset/train/y_train.txt")
                 
    # read feature names
    # convert them into legal variable names and remove data errors
    print("Reading feature names")
    feature_names <- read.table("./UCI HAR Dataset/features.txt")
    valid_feature_names <- gsub("[[:punct:]]", "", feature_names$V2)

    # fix an error as pointed out in the assignment discussion
    # https://class.coursera.org/getdata-011/forum/thread?thread_id=69
    valid_feature_names <- gsub("BodyBody", "Body", valid_feature_names)
                 
    # get indices for variables that contain mean (means) or std (standard 
    # deviations) in their name
    print("Finding variable names that contain mean or std")
    mean_std_ids <- grep("mean|std", valid_feature_names)
    mean_std_labels <- valid_feature_names[mean_std_ids]
                 
    # y_* are the activities that were performed - should convert to factor
    # read activity names
    # convert activity ids in y_* to factors
    activity_names <- read.table("./UCI HAR Dataset/activity_labels.txt")
    activity_labels <- activity_names$V2
                 
    y_test_data <- unlist(y_test_data)
    y_test_data <- as.numeric(y_test_data)
    y_test_fac <- factor(y_test_data, labels=activity_labels)
                 
    y_train_data <- unlist(y_train_data)
    y_train_data <- as.numeric(y_train_data)
    y_train_fac <- factor(y_train_data, labels=activity_labels)
                 
    # subset relevant columns for x_*
    names(x_test_data) <- valid_feature_names
    x_test_data <- x_test_data[,mean_std_ids]
                 
    names(x_train_data) <- valid_feature_names
    x_train_data <- x_train_data[,mean_std_ids]
                 
    # now put together the data sets - first test, then train
    print("Putting data sets together - subjectId, activity, measurements")
    names(subject_test_data) <- "SubjectID"
    data_for_test <- cbind(subject_test_data, y_test_fac)
    colnames(data_for_test)[2] <- "ActivityType"
    data_for_test <- cbind(data_for_test, x_test_data)
                 
    names(subject_train_data) <- "SubjectID"
    data_for_training <- cbind(subject_train_data, y_train_fac)
    colnames(data_for_training)[2] <- "ActivityType"
    data_for_training <- cbind(data_for_training, x_train_data)
                 
    all_mean_std_data <- rbind(data_for_test, data_for_training)
    
    print("Computing mean for each subject-activity pair, for each variable")
    required_data <- all_mean_std_data %>% 
        group_by(SubjectID, ActivityType) %>% 
        summarise_each(funs(mean))
                 
    write.table(required_data, "tidydata.txt", row.names = FALSE)
    print("Tidy data saved in file tidydata.txt")
}


