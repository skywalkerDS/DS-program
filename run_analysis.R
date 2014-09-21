# Clean Data porject 2, 18SEP2014 RQIN
# required to submit: 1) a tidy data set as described below, 
# 2) a link to a Github repository with your script for performing the analysis, and 
# 3) a code book that describes the variables, the data, and any transformations or work 
#    that you performed to clean up the data called CodeBook.md. 
# You should also include a README.md in the repo with your scripts. This repo explains 
# how all of the scripts work and how they are connected.

# 1. Merges the training and the test sets to create one data set.
setwd("C:/BigD/R-Train")

#Get test set variable data
system.time(test_set <- read.table("UCI HAR Dataset/test/X_test.txt"))
#Get test set subject data
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
colnames(test_subject) <- c("Subject")
#Get test set activity data
test_activity <- read.table("UCI HAR Dataset/test/y_test.txt")
colnames(test_activity) <- c("Activity")
#Complete test set data
nrow(test_subject)
nrow(test_set)
nrow(test_activity)
test_set2 <- cbind(test_subject,test_activity, test_set)
head(test_set2[,1:7], 1)

#Get train set variable data
system.time(train_set <- read.table("UCI HAR Dataset/train/X_train.txt"))
#Get train set subject data
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
colnames(train_subject) <- c("Subject")
#Get train set activity data
train_activity <- read.table("UCI HAR Dataset/train/y_train.txt")
colnames(train_activity) <- c("Activity")
#Complete train set data
train_set2 <- cbind(train_subject,train_activity, train_set)
head(train_set2[,1:7], 1)

#verify test and train sets
unique(test_set2$Subject)
unique(train_set2$Subject)

#Merge test and train sets
system.time(full_set <- rbind(train_set2, test_set2))
tail(full_set[,1:7])


# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# extract 561 vector names
var_labels <- read.table("UCI HAR Dataset/features.txt",as.is=T)
head(var_labels)
# insert subject and activity colnames
col_labels<- c("Subject","Activity",var_labels$V2)
colnames(full_set) <- col_labels
library(stringr)
# get indexes of "mean" and "std" measures, only for tAcc and tGyro (no fAcc or fGro)
colidx_mean_std_measure <- c(which(str_locate(col_labels,"t\\w+Acc-mean")[,1]>0),
                             + which(str_locate(col_labels,"t\\w+Acc-std")[,1]>0),
                             + which(str_locate(col_labels,"t\\w+Gyro-std")[,1]>0),
                             + which(str_locate(col_labels,"t\\w+Gyro-mean")[,1]>0))
# pick man std measure columns 
measure_set <- full_set[,c(1,2,colidx_mean_std_measure)]
head(measure_set[,1:7])

# 3. Uses descriptive activity names to name the activities in the data set
act_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
# merge to look up activity definition
mmact_set <- merge(act_labels, measure_set, by.y="Activity", by.x="V1")
# drop activity code column
mmact_set <- subset(mmact_set, select = -V1)
colnames(mmact_set)[1] <- "Activity"

# 4. Appropriately labels the data set with descriptive variable names. 
col_labels <- colnames(mmact_set)
col_labels <- str_replace(col_labels, "\\(\\)","")
col_labels <- str_replace(col_labels, "^t","")
head(col_labels) 
colnames(mmact_set) <- col_labels
head(mmact_set)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.
# melt the measurement data set into subject and activity
library(reshape2)
msa_melt<-melt(mmact_set, id=c("Subject","Activity"))
# dcast to get mean for varible measure for each subject and each activity
msa_set_mean <- dcast(msa_melt, Subject+Activity ~ variable, mean)
write.table(msa_set_mean, file='c:/measure_subject_activity_mean.txt', row.names=F)


