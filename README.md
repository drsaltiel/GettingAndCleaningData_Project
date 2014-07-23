---
title: "README.md"
date: "07/22/2014"
output: html_document
---

##Analysis of Human Activity Recognition Using Smartphones Data Set
For JHU/Coursera "Getting and Cleaning Data" Class

This project uses data from the UCI Machine Learning lab, information about which can be optained here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

and the data itself located here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This README explains how the script - run_analysis.R - cleans and processes the data.  There are no dependencies for this run_analysis.R.  run_analysis.R is located in the same repo as this README.

The run_analysis.R script puts out the data file tidy_data.txt which can be read in R using the read.table function - read.table("tidy_data.txt") (this will only work if you have the file in your working directory).

#Downloading the data
The data was downloaded and unzipped with the following code:
```{r, eval = FALSE}
#download and unzip data if not already present in directory 
#(note: only looks at if zip is present or not)
if (!file.exists("raw_data.zip")){
    fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, destfile = "./raw_data.zip", method = "curl")
    unzip("raw_data.zip")
}
```
#Retrieving data and labels
The data was loaded with the below code, as was the information needed for the data labels.  Correct labels were applied for the activity index and subject, as well as to the key for the correspondence between activity indexes and activity descriptions.
```{r, eval = FALSE}
#retrieve training and test data sets and labels
#and label columns with proper names
set_labels<-read.table("./UCI HAR Dataset/features.txt") #second column is X data labels

activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt") #key for activity meaning
colnames(activity_labels)<-c("activity_index", "activity_description")

subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(subject_train)<- "subject"
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
colnames(X_train)<-set_labels[,2]
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
colnames(y_train)<-"activity_index"

subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
colnames(subject_test)<- "subject"
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
colnames(X_test)<-set_labels[,2]
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
colnames(y_test)<-"activity_index"
```
#Merging data
The training data and test data were merged into two distinct sets by attaching the activity and subject files to the main data file using the cbind function.  These two distinct data sets were then merged together using the rbind function.
```{r, eval = FALSE}
#merge training and test data sets
train_data<-cbind(subject_train, y_train, X_train)
test_data<-cbind(subject_test, y_test, X_test)
merged_data<-rbind(train_data, test_data)
```
#Extract measurments on mean and standard deviation
The measurements mean and std measurements were extracted using the grep function (excluding the mean frequency - meanFreq - measurements as these are not the data we are interested in)
```{r, eval=FALSE}
#extract measurements on mean and std deviation
#excluding meanFreq measurements
cols<-intersect(grep("mean|std", set_labels[,2]), 
                grep("meanFreq", set_labels[,2], invert = T))
cols<-c(1,2,cols+2) #subject, y, and offset for subject, y
sub_data<-merged_data[,cols]
```
#Replace activity label with activity name
The activity index was replaced with the activity index using the merge function to merge the data with the activity labels correspondence key. The vestigial, surplus activity index column was then removed
```{r, eval = FALSE}
#replace activity label with activity name
sub_data<-merge(sub_data, activity_labels, by = "activity_index")
sub_data<-sub_data[,2:length(sub_data)]#drop extra activity_index column
```

#Create second, independent tidy data set
A second data set was created of the mean for each subject and activity using the aggregate function.  This subset was then printed to a tidy_data.txt file in the working directory.
```{r, eval=FALSE}
#create second, tidy independent data set
#with average of each variable for each activity and each subject
tidy_data<-aggregate(. ~activity_description+subject, data = sub_data, FUN=mean)

write.table(tidy_data, "./tidy_data.txt")
```

A Code Book of information located in CodeBook.md present in this repo.  This book describes the variables, the data, and their meaning.