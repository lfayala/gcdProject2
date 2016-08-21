# gcdProject2
Getting and Cleaning Data project 2

This repo contains the R scipt and data files created for the project 2 of the Getting and Cleaning Data project 2.
In order to run the scripts the dplyr package has to be installed on the computer.

Te script files are:

1) CreateTidyData.R - Contains the R script that calls the functions to generate both data sets (including the summarized data). To run the script the other two files have to be sourced previously (Project2.R and SummarizedData.R). T
2) Project2.R - Includes the code for the loadData function. The loadData function creates a tidy data frame for the specified paths. The parameters of the loadData function are: rootPath (where the features.txt and activity_labels.txt are stored), dataPath (where the X,y and subject text files are stored) and test (a boolean parameter to specify if test or train data is being processed).
3) SummarizedData.R - Has the code for the summarizedData function. The function takes a parameter called originalData (the tidy data frame that merges test and train data) and returns a data frame of summarized data (with the average of each variable for each activity and each subject).

To run the code:
1) Source Project2.R - To load loadData function
2) Source SummarizedData.R - To load the summarizedData function
3) Open the CreateTidyData.R and set the following variables:
    harDataPath - where the features.txt and activity_labels.txt are stored
    testPath - where the X,y and subject text files are stored for test data
    trainPath - where the X,y and subject text files are stored for train data
4) Select all the text from CreateTidyData.R file and run the code
5) The following filles will be recorded to the harDataPath:
    tydiData1.csv - csv file with the tidy data merged from both test and train data (with the measurements on the mean and standard deviation for each measurement, descriptive activity names to name the activities in the data set, appropriately labels the data set with descriptive variable names)
    tydiData2.csv - csv file with the summarized data (with the average of each variable for each activity and each subject)

