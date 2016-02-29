fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(fileUrl, destfile = "Dataset.zip")
unzip("Dataset.zip")

#Get the Activity labels
act_lbl <- read.table("./UCI HAR Dataset/activity_labels.txt") #Activity names

#Get the feature names
feat_lbl <- read.table("./UCI HAR Dataset/features.txt")

#Only interested in mean and standard deviation features
feat_m_sd_only <- grepl(".*(mean|std).*", feat_lbl$V2)

#Get the test data
x_data_test <- read.table("./UCI HAR Dataset/test/X_test.txt") #Measures
colnames(x_data_test) <- feat_lbl$V2 #Adding feature lables
x_data_test <- x_data_test[feat_m_sd_only] #Only using mean and SD values
y_data_test <- read.table("./UCI HAR Dataset/test/y_test.txt") #Activity-type
colnames(y_data_test) <- "Activityname" #Setting columnname to Activityname
subj_data_test <- read.table("./UCI HAR Dataset/test/subject_test.txt") #Person ID
colnames(subj_data_test) <- "Personid" #Setting columnname to Personid
test_data <- cbind(subj_data_test,y_data_test,x_data_test) #merge into test-set

#Get the training data
x_data_train <- read.table("./UCI HAR Dataset/train/X_train.txt") #Measures
colnames(x_data_train) <- feat_lbl$V2
x_data_train <- x_data_train[feat_m_sd_only]
y_data_train <- read.table("./UCI HAR Dataset/train/y_train.txt") #Activity-type
colnames(y_data_train) <- "Activityname" #Setting columnname to Activityname
subj_data_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") #Person ID
colnames(subj_data_train) <- "Personid" #Setting columnname to Personid
train_data <- cbind(subj_data_train,y_data_train,x_data_train) #merge into train-set

#Merge test and training into one set
merged_set <- rbind(test_data,train_data)
#Replace the activity ID with activity labels instead
merged_set$Activityname <- factor(merged_set$Activityname, act_lbl$V1, labels = act_lbl$V2)
order(merged_set)

#A second, independent tidy data set with the average of each variable 
#for each activity and each subject.
tidydata_set <- data.table(merged_set)
tidydata <-tidydata_set[,lapply(.SD,mean),keyby="Personid,Activityname"]
write.table(tidydata,file="tidy.csv",sep=",",row.names = FALSE)

