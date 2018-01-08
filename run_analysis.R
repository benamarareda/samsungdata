library(data.table)
library(dplyr)
# Load Files
xtest <- data.table(read.table("./test/X_test.txt"))
xtrain <- data.table(read.table("./train/X_train.txt"))
actlabels <- data.table(read.table("activity_labels.txt"))
ytest <- merge(data.table(read.table("./test/y_test.txt")),actlabels,by="V1")
ytrain <-merge(data.table(read.table("./train/y_train.txt")),actlabels,by="V1")
# Add subject columns to xtest & xtrain and move them to first position
subjecttest <- data.table(read.table("./test/subject_test.txt"))
subjecttrain <- data.table(read.table("./train/subject_train.txt"))
xtest[, subject := subjecttest$V1]
xtrain[, subject := subjecttrain$V1]
# Add activity labels to xtest and xtrain
xtest[, activity := ytest$V2]
xtrain[, activity := ytrain$V2]
# Reorder the columns
setcolorder(xtest,c(562,563,1:561))
setcolorder(xtrain,c(562,563,1:561))
# merge xtest and xtrain & order by subject
DataSet <- rbind(xtest,xtrain)
DataSet <- DataSet[order(DataSet$subject),]
# change column names to reflect the feature
features <- data.table(read.table("features.txt"))
names(DataSet) <-c("subject","activity",as.vector(features$V2))
# extract columns with mean / std measurements
mstdcolumns <- grep("mean|std",names(DataSet),value=TRUE)
DataSet2 <- DataSet[,c("subject","activity",mstdcolumns),with=FALSE]
# Produce the final tidy set
tidydata <- aggregate(DataSet2[,3:81],list(DataSet2$activity,DataSet2$subject),mean)
names(tidydata)[1] <- "activity"
names(tidydata)[2] <- "subject"
tidydata <- arrange(tidydata,tidydata$activity,tidydata$subject)



