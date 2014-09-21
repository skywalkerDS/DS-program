The R script "run_analysis.R" is to process data from "Human Activity Recognition Using Smartphones Dataset v1.0".
The experiment detail is here: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

and the raw data is here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The raw data is collected in experiments carried out with a group of 30 volunteers ("subjects"). Each person performed six "activities" (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity are captured as signals (called "variables", tAcc-XYZ and tGyro-XYZ). Acceleration signals are further derived for body acceleratin and gravity acceleration.  Our focus is on these 3 sets of 3-axial raw data, totally 9 variables (while other raw and calculation data are filtered out and excluded).

Please refer to the readme.txt, features.txt and feature_info.txt to understand the raw data.

To process the data, unzip the raw data into your work directory, and place the run_analysis.R in the same work directory and then run it. What the script does:
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The result dataset has the avarage values of Mean value and Standard deviation of these variables, for each subject and each activity, and they are organized into following 20 columns:

"Subject" : IDs of each subject, index from 1:30

"Activity" : Factor of 6 level activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

"BodyAcc-mean-X" : Numeric value.  Mean value of body acceleration variable, along X-axis

"BodyAcc-mean-Y" : Same as above, but along Y-axis

"BodyAcc-mean-Z" : Same as above, but along Z-axis

"GravityAcc-mean-X" : Numeric value.  Mean value of gravitity acceleration variable, along X-axis

"GravityAcc-mean-Y" : Same as above, but along Y-axis

"GravityAcc-mean-Z" : Same as above, but along Z-axis

"BodyAcc-std-X" : Numeric value.  Standard deviation of body acceleration variable, along X-axis

"BodyAcc-std-Y" : Same as above, but along Y-axis

"BodyAcc-std-Z" : Same as above, but along Z-axis

"GravityAcc-std-X" : Numeric value.  Standard deviation of gravitity acceleration variable, along X-axis

"GravityAcc-std-Y" : Same as above, but along Y-axis

"GravityAcc-std-Z" : Same as above, but along Z-axis 

"BodyGyro-std-X" : Numeric value.  Standard deviation of body angular velocity variable, along X-axis

"BodyGyro-std-Y" : Same as above, but along Y-axis

"BodyGyro-std-Z" : Same as above, but along Z-axis 

"BodyGyro-mean-X" : Numeric value.  Mean value of body angular velocity variable, along X-axis

"BodyGyro-mean-Y" : Same as above, but along Y-axis

"BodyGyro-mean-Z" : Same as above, but along Z-axis

Total records in the final dataset for 30 subjects who each has 6 activity levels, is 180. 
