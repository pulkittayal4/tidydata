library(dplyr)

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")


#Step1__________Merges the training and the test sets to create one data set

X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

#Step2_________Extracts only the measurements on the mean and standard deviation for each measurement

Tdata <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

#Step3_________Uses descriptive activity names to name the activities in the data set

Tdata$code <- activities[Tdata$code, 2]

#Step4_________Appropriately labels the data set with descriptive variable names

names(Tdata)[2] = "activity"
names(Tdata)<-gsub("Acc", "Accelerometer", names(Tdata))
names(Tdata)<-gsub("Gyro", "Gyroscope", names(Tdata))
names(Tdata)<-gsub("BodyBody", "Body", names(Tdata))
names(Tdata)<-gsub("Mag", "Magnitude", names(Tdata))
names(Tdata)<-gsub("^t", "Time", names(Tdata))
names(Tdata)<-gsub("^f", "Frequency", names(Tdata))
names(Tdata)<-gsub("tBody", "TimeBody", names(Tdata))
names(Tdata)<-gsub("-mean()", "Mean", names(Tdata), ignore.case = TRUE)
names(Tdata)<-gsub("-std()", "STD", names(Tdata), ignore.case = TRUE)
names(Tdata)<-gsub("-freq()", "Frequency", names(Tdata), ignore.case = TRUE)
names(Tdata)<-gsub("angle", "Angle", names(Tdata))
names(Tdata)<-gsub("gravity", "Gravity", names(Tdata))

#Step5________From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

Fdata <- Tdata %>%
  group_by(subject, activity) %>% summarise_all(funs(mean))
#Step6________tidy data stored in Fdata.txt
write.table(Fdata, "Fdata.txt", row.name=FALSE)
