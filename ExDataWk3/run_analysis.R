trainX <- "train/x_train.txt"
trainY <- "train/y_train.txt"
trainSubject <- "train/subject_train.txt"
testX <- "test/x_test.txt"
testY <- "test/y_test.txt"
testSubject <- "test/subject_test.txt"
features <- "features.txt"
activityFile <- "activity_labels.txt"

TrainResultsDF <- read.table(trainX)
TrainActivityDF <- read.table(trainY)
TrainSubjectDF <- read.table(trainSubject)
TestResultsDF <- read.table(testX)
TestActivityDF <- read.table(testY)
TestSubjectDF <-read.table(testSubject)
VariablesDF <- read.table(features,sep = "")
activityLabelDF <- read.table(activityFile)
colnames(activityLabelDF) <- c("ActivityType","Activity")

# Combine Train data and Test data
AllResultsDF <- rbind(TrainResultsDF, TestResultsDF)
AllActivityDF <- rbind(TrainActivityDF, TestActivityDF)
AllSubjectDF <- rbind(TrainSubjectDF, TestSubjectDF)

# Change the name of the columns based on features.txt
colnames(AllResultsDF) <- VariablesDF$V2

# Extract only "mean" and "std" columns
AllResultsMeanOrStdDF <- AllResultsDF[grepl("mean\\(\\)|std\\(\\)",names(AllResultsDF))]

# Name column for AllActivityDF
colnames(AllActivityDF) <- c("ActivityType")
ActivityLabeledDF <- merge(activityLabelDF, AllActivityDF, by = "ActivityType")


# Combine AllActivityDF & AllResultsDF
DetailResultsDF <- cbind(ActivityLabeledDF$Activity, AllSubjectDF,AllResultsMeanOrStdDF)
colnames(DetailResultsDF)[1] <- "Activity"
colnames(DetailResultsDF)[2] <- "Subject"

### Summarize the data by grouping and taking the mean
summarizedData <- aggregate(DetailResultsDF, DetailResultsDF[1:2], FUN=mean)

# Ignore - test with data.table
# DetailResultsDT <- data.table(DetailResultsDF)
# summarizedData <- DetailResultsDT[,lapply(.SD,mean),by=list(Subject,Activity)]

# Write to a file
write.table(summarizedData, "output.txt", row.name = FALSE)

