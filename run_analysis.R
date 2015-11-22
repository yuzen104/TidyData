# Loading Neccessary Libraries #
library(dplyr)
library(stringr)

###... READING THE FILES ...###
# Working Directory is the data folder of UCI HAR Dataset

x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

features <- read.table("features.txt", stringsAsFactors = FALSE)
activity_labels <- read.table("activity_labels.txt")



###... STEP 1. Merging the training and the test sets to create one data set ...###

# Naming the column of dataset for subjects and activities
names(subject_train) <- "subject"
names(subject_test) <- "subject"
names(y_train) <- "activity"
names(y_test) <- "activity"

# binding train and test dataset with their subjects and activities columns
train <- cbind(subject_train, y_train, x_train)
test <- cbind(subject_test, y_test, x_test)

# binding train and test dataset
oneData <- rbind(train, test)



###... STEP 2. Extracts only the measurements on the mean and standard deviation for each measurement ...###

# In "features" dataset which contains name of the measurements in colunm "V2", 
# get the index number of rows that including mean() and std()
# and combine those two index together in an integer vetor named mean_std_index
mean_index <- grep("mean\\(\\)", features$V2)
std_index <- grep("std\\(\\)", features$V2)
mean_std_index <- sort(c(mean_index, std_index))

# But, since 'oneData' dataset has two columns in the front specifying 'subject' and 'activity'
# add 2 to 'mean_std_index' to match with the original x_test/x_train datasets column order
mean_std_index2 <- c(1,2, mean_std_index + 2)


# Extract columns from "oneData" that matches with the mean_std_index
# which contains only mean and std measurement
# Name this dataset as "meanStdData"
meanStdData <- select(oneData, mean_std_index2)

# Also extract rows from "features" dataset with matching row indices of mean_std_index
# using dplyr filter rows by row indices

mean_std_features <- filter(features, rownames(features) %in% mean_std_index)
# or
# mean_std_features <- filter(features, V1 %in% mean_std_index)
# since "V1" column of 'features' dataset contains row indices here


###... STEP 3. Using descriptive activity names to name the activities in the data set ...###

names(activity_labels) <- c("activity", "activity_name")
data <- merge(activity_labels, meanStdData)


###.... REMOVE DATASETS ....###
# Remove dataset not used anymore, to save space and avoid confusion #
rm(x_train); rm(x_test); rm(y_train); rm(y_test); rm(test); rm(train); rm(oneData); rm(features)
rm(subject_train); rm(subject_test)
rm(meanStdData); rm(mean_index); rm(std_index); rm(mean_std_index); rm(mean_std_index2)



###... STEP 4. Appropriately labels the data set with descriptive variable names. ...###
# Parsing column 2 of 'mean_std_features' dataset to get the proper names
splitNames <- strsplit(mean_std_features$V2, "-")

names <- matrix(nrow=66, ncol=3)
for (i in 1:66){ names[i,1] <- splitNames[[i]][1] }
for (i in 1:66){ names[i,2] <- splitNames[[i]][2] }
for (i in 1:66){ names[i,3] <- splitNames[[i]][3] }
names <- as.data.frame(names)
names$V4 <- substring(names$V1,1,1)
names$V5 <- gsub("^[ft]","", names$V1)
names$V6 <- ifelse(names$V2=="mean()", "mean", "standard_deviation")
names$V7 <- ifelse(names$V4=="t", "time", "frequency")
names$V8 <- ifelse( is.na(names$V3), "", paste("on", names$V3, "axis") )
names <- select(names, V6, V7, V5, V8)
names(names) <- c("formula", "signal_domain", "measure", "axis")
names$vname <- paste( names$formula, "of", names$signal_domain, "signal of", names$measure, names$axis )
names$vname <- str_trim(names$vname)

# Naming the dataset
var_name <- gsub(" ", "_", names$vname)
names(data)[4:69] <- var_name


###... STEP 5. From the data set in step 4, creates a second, independent tidy data set
###            with the average of each variable for each activity and each subject.

var_average <- data %>%
     group_by(activity_name, subject) %>%
     summarize_each(funs(mean))%>%
     arrange(activity, subject)%>%
     print

# Somehow, the arrange function above doesn't work... I couldn't figure this out yet,
# But in the meantime, use order function in base package...
var_average <- var_average[order(var_average$activity, var_average$subject), ]

write.table(var_average, "tidy_data_set_created_in_step_5.txt", row.names = FALSE)


# When read the textfile into R : 
# read.table("tidy_data_set_created_in_step_5.txt", header=TRUE)
