## List of the files
* features.txt - list of the variables
* activity_labels.txt - mapping between ID for activities vs. type of activities

* train and test data
  - X_test.txt - measurements
  - y_test.txt - mapping to the activity ID
  - subject_test.txt - maping to the subject

## Read files into dataframe
* Results - TrainSesultsDF / TestResutsDF
* Subject list - TrainsubjectsDF / TestSubjectsDF
* variables list - VariablesDF
* column name for the results - activityLabelDF
* Activity in the results - TrainActivityDF / TestActivityDF
* descriptive activity names - ActivityLabelDF

## Combined data between Train and TestData
* Results - AllResultsDF
* Activity in the results - AllActivityDF
* Subject mapping - AllSUbjectF


## Extracted data - just mean and std
* AllResultsMeanOrStdDF
* DetailResultsDF - with disctiptive activity names

## Final data
*Å@summarizedData - final data grouped by Activity and Subject

