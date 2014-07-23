#download and unzip data if not already present in directory 
#(note: only looks at if zip is present or not)
if (!file.exists("raw_data.zip")){
    fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, destfile = "./raw_data.zip", method = "curl")
    unzip("raw_data.zip")
}



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



#merge training and test data sets
train_data<-cbind(subject_train, y_train, X_train)
test_data<-cbind(subject_test, y_test, X_test)
merged_data<-rbind(train_data, test_data)



#extract measurements on mean and std deviation
#excluding meanFreq measurements
cols<-intersect(grep("mean|std", set_labels[,2]), 
                grep("meanFreq", set_labels[,2], invert = T))
cols<-c(1,2,cols+2) #subject, y, and offset for subject, y
sub_data<-merged_data[,cols]



#replace activity label with activity name
sub_data<-merge(sub_data, activity_labels, by = "activity_index")
sub_data<-sub_data[,2:length(sub_data)]#drop extra activity_index column



#create second, tidy independent data set
#with average of each variable for each activity and each subject
tidy_data<-aggregate(. ~activity_description+subject, data = sub_data, FUN=mean)

write.table(tidy_data, "./tidy_data.txt")