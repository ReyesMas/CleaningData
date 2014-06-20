##
## COURSE PROJECT - GETTING AND CLEANING DATA (COURSERA)

## 0 DOWNLOAD AND UNZIP THE FILE
       
        ## DOWNLOAD FILE if doesn't exist
        if (!file.exists("UCI HAR Dataset")) {
            print("Downloading and unzipping the file...please wait...")
            fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
            temp <- tempfile()
            download.file(url=fileURL, destfile=temp)
            ## unzip file in working directory
            unzip(temp)
            unlink(temp)
        }
        
## 1 TASK: MERGES THE TRAINING AND THE TEST SETS TO CREATE ONE DATA SET

        ## Getting the training set.
        ## -------------------------
        
        print("Preparing the training set...please wait...")
        
        
        ## We are going to include, in adtition to the training set, an identifier 
        ## of the subject who carried out the experiment and the activity the 
        ## subject has performed.
        ## 
        ## The feature train set will be read from the local file: 
        ##      "UCI HAR Dataset/train/X_train.txt"
        ##
        ## The variables will be labeled with the names of the features from the
        ## list in "UCI HAR Dataset/features.txt" file.
        ##
        ## The activity that corresponds to each record will be get from the file: 
        ##      "UCI HAR Dataset/train/Y_train.txt".
        ##
        ## This file contains the class label. The links between class labels and 
        ## activity names can be found in "UCI HAR Dataset/activity_labels.txt" 
        ## file.
        ##
        ## The subject who  performed  the activity  for  each record will be get
        ## from the file: 
        ##      "UCI HAR Dataset/train/subject_train.txt" file
        ##
        ## It is important to note that the order of the rows in the "Y_train.txt"
        ## and "subject_train.txt" files  corresponds to the order of the rows in 
        ## the "X_train.txt" file. In the same way, the order of the variables in 
        ## the "X_train.txt" file corresponds to the order of the features in the 
        ## "features.txt" file.
        ##
        
        ##  Getting the activity labels
        activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("activity_id","activity_name"))
    
        ##  Getting the variable names
        features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors=FALSE, col.names=c("feature_id","feature_name"), check.names=TRUE)
        colnames <- features$feature_name
        
        ## It is necessary to replace, from the colnames, some characteres that are not syntactically valid for variable names
        # change dash for underscore, remove parentheses, replace some commas with the word "to" and others by points  
        colnames <- gsub("-", "_", colnames,fixed=TRUE)
        colnames <- gsub("()", "", colnames,fixed=TRUE)
        colnames <- gsub("),", ",", colnames,fixed=TRUE)
        colnames <- gsub(")", "", colnames,fixed=TRUE)
        colnames <- gsub("(", "_", colnames,fixed=TRUE)
        colnames <- gsub("([0-9]),([0-9])", "\\1to\\2", colnames)
        colnames <- gsub("([a-zA-Z]),([a-zA-Z])", "\\1_to_\\2", colnames)
        colnames <- gsub(",", ".", colnames,fixed=TRUE)
    
        ##  Getting feature training data
        featureTrain <- read.table("UCI HAR Dataset/train/X_train.txt", col.names=colnames)
            
        ##  Getting the activity 
        activityTrain <- read.table("UCI HAR Dataset/train/Y_train.txt", col.names=c("activity"), colClasses=c("factor"))
        levels(activityTrain$activity) <- activityLabels$activity_name
        
        ##  Getting the subject who performed the activity
        subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names=c("subject_id"))
       
        ##  train data
        dataTrain <- data.frame(subjectTrain$subject_id, activityTrain$activity, featureTrain)
        names(dataTrain) = c("subject_id","activity", colnames)
   
        ## Getting the test set.
        ## ---------------------
        
        print("Preparing the test set...")
        
        
        ## We are going to include, in adtition to the test set, an identifier 
        ## of the subject who carried out the experiment and the activity the 
        ## subject has performed.
        ##
        ## The feature test set will be read from the local file: 
        ##      "UCI HAR Dataset/test/X_test.txt"
        ##
        ## The variables (columns) will be labeled with the names of the features 
        ## from the list in "UCI HAR Dataset/features.txt" file.
        ##
        ## The activity that corresponds to each record will be get from the file: 
        ##      "UCI HAR Dataset/test/Y_test.txt".
        ##
        ## This  file  contains  the  class label. The links between class labels
        ## and activity names can be found in "UCI HAR Dataset/activity_labels.txt" 
        ## file.
        ##
        ## The subject who  performed the activity for each record can be found in
        ## the file: 
        ##      "UCI HAR Dataset/test/subject_test.txt" file
        ##
        ## It is important to note that  the  order of the rows in the "Y_test.txt" 
        ## and "subject_test.txt" files  corresponds to the order of the rows in 
        ## the "X_test.txt" file. In the same way, the order of the variables in  
        ## the "X_test.txt"   file  corresponds  to the order of the features in  
        ## the "features.txt" file.
        ##  
       
        ##  Getting the activity labels
        ##  As the activities are  the same for the test sample than for the train 
        ##  sample is not necessary to read them again, we can use the object 
        ##  activityLabels
       
        ##  Getting the variable names
        ##  As the variable names are  the same for the test sample than for the 
        ##  train sample is not necessary to read them again, we can use the object 
        ##  features
       
        ##  Getting feature test data
            featureTest <- read.table("UCI HAR Dataset/test/X_test.txt", col.names=colnames)
       
        ##  Getting the activity 
            activityTest <- read.table("UCI HAR Dataset/test/Y_test.txt", col.names=c("activity"), colClasses=c("factor"))
            levels(activityTest$activity) <- activityLabels$activity_name
       
        ##  Getting the subject who performed the activity
            subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names=c("subject_id"))
       
        ##  test data
            dataTest <- data.frame(subjectTest$subject_id, activityTest$activity, featureTest)
            names(dataTest) = c("subject_id","activity", colnames)
   
        ##
        ## Now, we have got two data frames, Both contain the following variables:
        ##      subject_id - an identifier of the subject who carried out the experiment
        ##      activity - the activity the subject has performed
        ##      the 561 feature variables
        ##
        ## The next step is to join by rows the two sets to create one data set 
        ##
        ##  Join the two data set
            print("Joining the data...")
            WholeData <- rbind(dataTrain,dataTest)
        
            subjectTrain <- unique(dataTrain$subject_id)
            subjectTest <- unique(dataTest$subject_id)
        
        ##  The data set has got descriptive activity names to name the activities and 
        ##  descriptive variable names because they have inherited them from the files 
        ##  dataTrain and dataTest.
        
        ##  In adition, to free memory we are going to remove objects that are now 
        ##  redundant
            rm(dataTrain)
            rm(dataTest)
            rm(activityTest)
            rm(activityTrain)
            rm(featureTest)
            rm(featureTrain)
            rm(subjectTest)
            rm(subjectTrain)
        
## 2 TASK: EXTRACT ONLY THE MEASUREMENTS ON THE MEAN AND STANDAR DEVIATION FOR 
##         EACH MEASUREMENT    
        
        print("Extract some measurements...")

        ## The variables that are going to be extracted are:
   
            choose <- names(WholeData)[grep("mean$|std$|mean_|std_", names(WholeData))]
   
        ## Note that the meanfrec has not been included Since it is not, itself, 
        ## "a measurement on the mean for each measurement"
        
            extractData <- WholeData[,choose]
        
## 3 TASK: USES DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET
        
        ## It is not necessary to do any thing more as the data set has got 
        ## descriptive activity names because it have inherited them from the files
        ## dataTrain and dataTest.
        
## 4 TASK: APPROPRIATELY LABELS THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES
        
        ## It is not necessary to do any thing more as the data set has got  
        ## descriptive variable names because it have inherited them from the files 
        ## dataTrain and dataTest.
        
## 5 TASK: CREATE A TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY
##         AND EACH SUBJECT
            
        print("Getting the tidy data set...")
        
            s <- split(WholeData[,3:563],WholeData[,1:2])
            final <- data.frame(activity=rep(activityLabels$activity_name,each=30), subject_id=rep(1:30,6),t(sapply(s, colMeans)))
        
        ## Write a file with de data frame
            
            write.table(final, file="TidyDataSet.txt")
       
            
