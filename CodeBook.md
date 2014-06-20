Course Project - Getting and Cleaning Data (Coursera)
=====================================================

Index
-----
1. Introduction

2. The Original data Source

3. The Project Data
    * Project Data Source
    * File Structure
    * Contents of the Files
    
4. Feature Variables

5. The Tidy data set
    * The process
        * Step 1. Getting the training data set
        * Step 2. Getting the test data set
        * Step 3. Joining Test and Training data frames
        * Stpe 4. Creating the tidy data set 

6. Another tasks

1. Introduction
---------------

The porpouse of this "CodeBook" file is to describe the variables, the data, and any transformations or work performed to clean the data. Along with this file, a README.md file with information about the course project and "run_analysis.R" script is provided.

2. The Original Data Source
---------------------------

The data used in the course project represent data collected from the accelerometers from the Samsung Galaxy S smartphone. The data comes from the web site:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Source
    Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
    
    Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.     
    Smartlab - Non Linear Complex Systems Laboratory        
    DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy.           
    activityrecognition '@' smartlab.ws          
    www.smartlab.ws            
    
### Data Set Information:

    The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

    The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

A full description is available at the site where the data was obtained

3. The Project data
-------------------

### Project Data Source

In the link below you can find the data that are used for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Data Structure
The data we are going to use are organized as follows:

* Folder UCI HAR Dataset
    * File activity_labels.txt
    * File featuers.txt
    * Folder test
        * File X_test.txt
        * File subject_test.txt
        * File y_test.txt
    * Folder train
        * File X_train.txt
        * File subject_train.txt
        * File y_train.txt
    
    
*Note that the list shows only the files actually used in the course project.*

### Conents of the Files
The contents of each file is as follow:

#### * *Common*
#### File UCI HAR Dataset/activity_labels.txt
The list of the activities the volunteers performed. There are six activities coded with numbers from 1 to 6. 
This file contains the links between class labels and activity names 
    
#### File UCI HAR Dataset/featuers.txt
The feature list.
This list is the same for both, the training sample and the test sample. There are a total of 561 features

#### * *Test Sample Data*
#### File UCI HAR Dataset/test/X_test.txt
Contains the feature test set. Each record is a 561-feature vector with time and frecuency domain variables. 

#### File UCI HAR Dataset/test/subject_train.txt
The subject who performed the activity for each record in file UCI HAR Dataset/test/X_test.txt

#### File UCI HAR Dataset/test/y_test.txt
The activity that corresponds to each record in file UCI HAR Dataset/test/X_test.txt. This file contains the class label, the activity name can be found in the UCI HAR Dataset/test/X_test.txt file.

#### * *Training Sample Data*
#### File UCI HAR Dataset/train/X_train.txt
Contains the feature training set. Each record is a 561-feature vector with time and frecuency domain variables. 

#### File UCI HAR Dataset/train/subject_train.txt
The subject who performed the activity for each record in file UCI HAR Dataset/train/X_train.txt

#### File UCI HAR Dataset/train/y_train.txt
The activity that corresponds to each record in file UCI HAR Dataset/train/X_train.txt. This file contains the class label, the activity name can be found in the UCI HAR Dataset/train/X_train.txt file.
        
4. Feature Variables
--------------------

### Feature Selection
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyGyro-XYZ
* tBodyAccJerk-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyGyroMag
* tBodyAccJerkMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyGyro-XYZ
* fBodyAccJerk-XYZ
* fBodyAccMag
* fBodyGyroMag
* fBodyAccJerkMag
* fBodyGyroJerkMag

The set of variables that were estimated from the time domain signals are: 

* mean(): Mean value              
* std(): Standard deviation           
* mad(): Median absolute deviation
* max(): Largest value in array
* min(): Smallest value in array 
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values.
* iqr(): Interquartile range
* entropy(): Signal entropy 
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals 

The set of variables that were estimated from the time domain signals are: 

* mean(): Mean value 
* std(): Standard deviation 
* mad(): Median absolute deviation 
* max(): Largest value in array 
* min(): Smallest value in array 
* sma(): Signal magnitude area 
* energy(): Energy measure. Sum of the squares divided by the number of values.
* iqr(): Interquartile range  
* entropy(): Signal entropy 
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency 
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal  
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

The following varaible were estimated too.    
* angle(): Angle between to vectors. 

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'.

5. The tidy data set
--------------------

A set with the average of each variable for each activity and each subject.

This set comes easily from a set with the subject, activity, and all feature variables for the entire sample.

### The process
As we have the data divided into two samples, "training" and "test", first we will prepare a data frame for each of them and finally we will gather the two data frames into one.

### Step 1. *Getting the training data set*

We are going to include, in adtition to the training set, an identifier of the subject who carried out the experiment and the activity the subject has performed. Apropiate descriptive varaible names will be used.

* The feature train set will be read from the local file "UCI HAR Dataset/train/X_train.txt" into a data.frame
* The variables will be labeled with the names of the features from the list in "UCI HAR Dataset/features.txt" file. In order to obtain descriptive variables while syntactically correct, it is necessary to replace some characteres that are not syntactically valid from the labels:
    * dash is changed for underscore
    * parentheses are removed
    * some commas are replaced with the word "to" and others with points           
           
    __These are the changes (order is important):__  
    
        colnames <- gsub("-", "_", colnames,fixed=TRUE)      
        colnames <- gsub("()", "", colnames,fixed=TRUE)      
        colnames <- gsub("),", ",", colnames,fixed=TRUE)      
        colnames <- gsub(")", "", colnames,fixed=TRUE)      
        colnames <- gsub("(", "_", colnames,fixed=TRUE)      
        colnames <- gsub("([0-9]),([0-9])", "\\1to\\2", colnames)      
        colnames <- gsub("([a-zA-Z]),([a-zA-Z])", "\\1_to_\\2", colnames)     
        colnames <- gsub(",", ".", colnames,fixed=TRUE)     
        
* The activity that corresponds to each record in the feature data frame will be read from the file "UCI HAR Dataset/train/Y_train.txt" into a factor. The factor levels will be the activity names that can be read from the file "UCI HAR Dataset/activity_labels.txt". In this file we can found the links between the class labels from "Y_train.txt" and the activity names.

* The subject who  performed  the activity  for  each record will be read from the file "UCI HAR Dataset/train/subject_train.txt" file into a data frame with only one variable called subject_id .

* Now we just need to join the subject, activity and characteristics in a single data frame 
It is important to note that the order of the rows in the "Y_train.txt" and "subject_train.txt" files  corresponds to the order of the rows in the "X_train.txt" file. In the same way, the order of the variables in the "X_train.txt" file 
corresponds to the order of the features in the "features.txt" file.        
           
        'data.frame':    7352 obs. of  563 variables:
        $ subject_id                        : int  1 1 1 1 1 1 1 1 1 1 ...   
        $ activity                          : Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..: 5 5 5 5 5 5 5 5 5 5 ...   
        $ tBodyAcc_mean_X                   : num  0.289 0.278 0.28 0.279 0.277 ...    
        $ tBodyAcc_mean_Y                   : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...    
        $ tBodyAcc_mean_Z                   : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...    
        [list output truncated]    
        
    
### Step 2. *Getting the test data set*   
We are going to include, in adtition to the test set, an identifier of the subject who carried out the experiment and the activity the subject has performed. Apropiate descriptive varaible names will be used.

* The process to obtain the test data frame is the same than the one for the training data set descrived above but using the test files. The data frame that is obtained is this:

        'data.frame':    2947 obs. of  563 variables:
        $ subject_id                        : int  2 2 2 2 2 2 2 2 2 2 ...
        $ activity                          : Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..: 5 5 5 5 5 5 5 5 5 5 ...
        $ tBodyAcc_mean_X                   : num  0.257 0.286 0.275 0.27 0.275 ...
        $ tBodyAcc_mean_Y                   : num  -0.0233 -0.0132 -0.0261 -0.0326 -0.0278 ...
        $ tBodyAcc_mean_Z                   : num  -0.0147 -0.1191 -0.1182 -0.1175 -0.1295 ...
        [list output truncated]    
        

### Step 3. Joining Test and Training data frames
Now, we have got two data frames, both containing the following variables:  

   -. subject_id,  an identifier of the subject who carried out the experiment    
   -. activity, the activity the subject has performed    
   -. the 561 feature variables    

* The next step is to join by rows (rbind) the two sets to create one data set. We name this data frame "WholeData".

        'data.frame':       10299 obs. of  563 variables:
        $ subject_id                        : int  1 1 1 1 1 1 1 1 1 1 ...   
        $ activity                          : Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..: 5 5 5 5 5 5 5 5 5 5 ...   
        $ tBodyAcc_mean_X                   : num  0.289 0.278 0.28 0.279 0.277 ...    
        $ tBodyAcc_mean_Y                   : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...    
        $ tBodyAcc_mean_Z                   : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...    
        [list output truncated]    
        
* The data set has got descriptive activity names to name the activities, and descriptive variable names for features, because it has inherited them from the Train and Test data frames.
        
        ##  In adition, to free memory we are going to remove the data frames dataTest 
        ##  and dataTrain If we need them again we can use subjectTest and subjectTrain 
        ##  to get them from the joinData set.
            rm(dataTrain)
            rm(dataTest)

### Stpe 4. Creating the tidy data set 

A set with the average of each variable for each activity and each subject.     
The task is easy using the WholeData dat frame:

* split the data frame by subject and activity
* compute colMeans on each split
* add subject and activity columns
* write the resulting data frame in a file in the working directory 

6. Another tasks
----------------

### Extract only the measurements on the mean and standard deviation for each measurement

The script also craetes a data frame an a file from the whole data, extracting the mmeasurements on the mean and standard deviation for each measurement. The variables that are going to be extracted are those which name ends with the words "mean" or "std" or contains the words "mean_" or "std_".

Note that the meanfrec has not been included Since it is not, itself, "a measurement on the mean for each measurement"
        
           
        
