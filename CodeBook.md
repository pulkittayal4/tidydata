
1.  Varaibles assigned to each data as follows:

features <- features.txt :              The features selected for this database come from the accelerometer and gyroscope.

activities <- activity_labels.txt :     List of activities performed

subject_test <- test/subject_test.txt

x_test <- test/X_test.txt :             contains data for X_test.txt

y_test <- test/y_test.txt :             contains test for activities

subject_train <- test/subject_train.txt

x_train <- test/X_train.txt :     train data
y_train <- test/y_train.txt :     contains train data of activities


2.  Variables after merging datasets

X  is created by merging x_train and x_test using rbind() function
Y  is created by merging y_train and y_test using rbind() function
Subject  is created by merging subject_train and subject_test using rbind() function
Merged_Data  is created by merging Subject, Y and X using cbind() function

3. Tdata contains variables like Subject, code and variables which contains "mean" and "std"

4. code column in TidyData renamed into activities
5.  Variables replaced as follows: 
Acc  replaced by Accelerometer
Gyro  replaced by Gyroscope
BodyBody  replaced by Body
Mag  replaced by Magnitude

6. Fdata contains tidy data.
