The file run_analysis.R contains the code for the solution to the assignment in Week 4 of the on-line Coursera course: Getting and Cleaning data

The following variables are used:
fileurl: the provided URL to the Data set for the project
act_lbl: dataframe containing the data from the activity_lables.txt file
feat_lbl: dataframe containing the data from the features.txt file
feat_m_sd_only: a logic vector containing all the features that are either mean or standard deviations from the feat_lbl dataframe

x_data_test: the data from the X_test.txt file
y_data_test: the data from the y_test.txt file
subj_data_test: the data from the subject_test.txt file
test_data: dataframe that contains the merged test data
x_data_train: the data from the X_train.txt file
y_data_train: the data from the y_train.txt file
subj_data_train: the data from the subject_train.txt file
train_data: dataframe that contains the merged train data

merged_set: the merged dataframe of test_data and train_data

tidydata_set: a copy of the merged_set
tidydata: the average of all measures for each activity and for each subject

Getting and cleaning process:
Dataset is downloaded and unzipped in the current folder where the run_analysis.R script resides
activity_lables.txt, features.txt, X_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt and finally the subject_train.txt are all imported into the code.

from the activity_lables.txt we get the lables we use to replace the activity_id in the final data set
from the features.txt file we extract only those feature labels that contiains "mean" and "std", and also the lables for each feature measured.

from the X_data_test we only use the features that contains means and std.

We bind-by-column the 3 sets from test and training respectively, and finally bind-by-rows the two resulting sets into one big merged dataset. Naming the variables from the features.txt file and replace the Activity ID's with the more saying activity labels from the activity_lables.txt file.

Further handling is a copy of the resulting merged data set, into a new set, where we consolidate tha data from each individual (subject) and factorized on each activity-type, and calculating the mean on all the measures. Saving the result to a file called tidy.csv, a comma-separated file contianing the resulting data.



