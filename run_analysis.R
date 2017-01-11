setwd("C:/Users/pduhoon/Documents/R/UCI HAR Dataset/")
feat<-read.table("features.txt")
#summary(feat)
x_test<-read.table("test/X_test.txt")
y_test<-read.table("test/y_test.txt")
sub_test<-read.table("test/subject_test.txt")

x_train<-read.table("train/X_train.txt")
y_train<-read.table("train/y_train.txt")
sub_train<-read.table("train/subject_train.txt")

x_test[,562]<-y_test[,1]
x_test[,563]<-sub_test[,1]

x_train[,562]<-y_train[,1]
x_train[,563]<-sub_train[,1]

labels<-read.table("activity_labels.txt")
feat[,2] = gsub('[-()]', '', feat[,2])


colnames(x_test) <- c(feat[,2], "Activity", "Subject")
colnames(x_train) <- c(feat[,2], "Activity", "Subject")
cbnd_data<-rbind(x_test,x_train)


colnames(cbnd_data) <- tolower(colnames(cbnd_data))

selcol <- grep(".*mean.*|.*std.*", colnames(cbnd_data))
cbnd_data<-cbind(cbnd_data[,selcol],cbnd_data[,562:563])

attach(cbnd_data)

activc = 1
for (activcLabel in labels[,2]) {
  cbnd_data$activity <- gsub(activc, activcLabel, cbnd_data$activity)
  activc <- activc + 1
}

cbnd_data[,87]<-as.factor(activity)
cbnd_data[,88]<-as.factor(subject)

clean = aggregate(cbnd_data, by=list(activity,subject), mean)
