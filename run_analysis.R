library (plyr)

# Read in the train data
xTrain <- read.table("UCI\ HAR\ Dataset/train/X_train.txt")
yTrain <- read.table("UCI\ HAR\ Dataset/train/y_train.txt")
subjectTrain <- read.table("UCI\ HAR\ Dataset/train/subject_train.txt")

# Read in the test data

xTest <- read.table("UCI\ HAR\ Dataset/test/X_test.txt")
yTest <- read.table("UCI\ HAR\ Dataset/test/y_test.txt")
subjectTest <- read.table("UCI\ HAR\ Dataset/test/subject_test.txt")
featureNames <- read.table("UCI\ HAR\ Dataset/features.txt",head=FALSE)


# Combine the Test data and Train data for x, y, and subject

xData <- rbind(xTrain,xTest)
yData <- rbind(yTrain,yTest)
subjectData <- rbind(subjectTrain,subjectTest)

names(xData) <- featureNames$V2
names(subjectData) <- c("subject")
names(yData) <- c("activity")
finalData <- cbind(xData,yData,subjectData)



# Extract the names of the features by measurements on the mean and std. dev

subFeatureNames <- featureNames$V2[grep("mean\\(\\)|std\\(\\)",featureNames$V2)]
selectedNames <- c(as.character(subFeatureNames),"subject","activity")
finalData <- subset(finalData,select=selectedNames)

# Create meaningful activity names in the dataframe
names(finalData) <- gsub("^t","time",names(finalData))
names(finalData) <- gsub("^f","frequency",names(finalData))
names(finalData) <- gsub("Acc","Accelerometer",names(finalData))
names(finalData) <- gsub("Gyro","Gyroscope",names(finalData))
names(finalData) <- gsub("Mag","Magnitude",names(finalData))
names(finalData) <- gsub("BodyBody","Body",names(finalData))

finalData$activity <- as.factor(finalData$activity)
levels(finalData$activity) <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

# Finally, create our tidy data set
tidyData <- aggregate(. ~subject + activity, finalData,mean)
tidyData <- tidyData[order(tidyData$subject,tidyData$activity),]
write.table(tidyData,file="tidydata.txt",row.name=FALSE)

