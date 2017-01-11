#use getwd() to get your current working directory, use setwd to change working directory to extracted data set from the zip downloaded 
#from the UCI website (the link is present in readme and codebook too.
setwd("C:/Users/pduhoon/Documents/R/UCI HAR Dataset/")
#read features for this data set
feat<-read.table("features.txt")
#summary(feat)
#read test set
x_test<-read.table("test/X_test.txt")
y_test<-read.table("test/y_test.txt")
sub_test<-read.table("test/subject_test.txt")

#read training set
x_train<-read.table("train/X_train.txt")
y_train<-read.table("train/y_train.txt")
sub_train<-read.table("train/subject_train.txt")

#append subject and activity to x_test and x_train
x_test[,562]<-y_test[,1]
x_test[,563]<-sub_test[,1]
x_train[,562]<-y_train[,1]
x_train[,563]<-sub_train[,1]

#read activity labels for referencing activity column or the y_test vector
labels<-read.table("activity_labels.txt")

#cleanup the feature vector for a cleaner data labels
feat[,2] = gsub('[-()]', '', feat[,2])

#Add the cleaned up feature vectors to the column names for the training and test set
colnames(x_test) <- c(feat[,2], "Activity", "Subject")
colnames(x_train) <- c(feat[,2], "Activity", "Subject")

#merge training and test data set
cbnd_data<-rbind(x_test,x_train)
colnames(cbnd_data) <- tolower(colnames(cbnd_data))

#select columns with labels containing mean and standard deviation
selcol <- grep(".*mean.*|.*std.*", colnames(cbnd_data))

#rejecting columns that do not contain mean and standard deviations in the data set as per the requirement of this project
cbnd_data<-cbind(cbnd_data[,selcol],cbnd_data[,562:563])

attach(cbnd_data)

#converting activity as its subjective description and converting it (and subject) to factors
activc = 1
for (activcLabel in labels[,2]) {
  cbnd_data$activity <- gsub(activc, activcLabel, cbnd_data$activity)
  activc <- activc + 1
}
cbnd_data[,87]<-as.factor(activity)
cbnd_data[,88]<-as.factor(subject)

#Aggregating data based on mean values for respective subject and activity
clean = aggregate(cbnd_data, by=list(activity,subject), mean)

#write the final data to tidy.txt as per the final requirement of the project
write.table(clean, "tidy.txt", row.names = FALSE, quote = FALSE)
