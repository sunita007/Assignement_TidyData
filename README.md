# Assignement_TidyData
This assignment is completed by Sunita Negi.

The objective of assignment is to create the tidy dataset.

The scripts first unzips the file folder which is downloaded from the website. 
Two more columns are added to each training and testing feature files separately to represent activity and subject. 
Then script combines the test (X_test) and train (X_train) data to make a one unified dataset with two additional columns.

For the second part-
Before labeling the data set with features two additional columns are added to feature file to match with activity and subject columns.
Mean and standard deviation are pulled from the dataset for two main variables( BodyAcc and GravityAcc).
Dataset with mean and standard deviation is created to satisfy the requirement of part 2 (mean_sd).

For the third part
Numbers for activity are replaced with activity labels.

For the 4th part.
Descriptive variable names are added and special characters are removed.

For the 5th part
Group by is performed on subject and activity name before summarizing mean on every variable.
Finally text file generated.
