
rm(list = ls())

train <- read.table('UCI HAR Dataset/train/X_train.txt')

test <- read.table('UCI HAR Dataset/test/X_test.txt')

# merge the training and the test sets to create one data set
data <- rbind(train, test)

# appropriately label the data set with descriptive variable names
features <- read.table('UCI HAR Dataset/features.txt')[,2]
names(data) <- features

# extract only the measurements on the mean and standard deviation for each measurement
data <- data[, grep("mean\\(|std\\(", names(data))]

activity_train <- read.table('UCI HAR Dataset/train/y_train.txt')
activity_test <- read.table('UCI HAR Dataset/test/y_test.txt')
activity <- rbind(activity_train, activity_test)
data <- cbind(activity, data)
names(data)[1] <- 'ACTIVITY'

subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt')
subject_test <- read.table('UCI HAR Dataset/test/subject_test.txt')
subject <- rbind(subject_train, subject_test)
data <- cbind(subject, data)
names(data)[1] <- 'SUBJECT'

activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt')

# use descriptive activity names to name the activities in the data set
library(dplyr, warn.conflicts = FALSE)

data <- data %>%
  mutate(SUBJECT = factor(SUBJECT), ACTIVITY = factor(case_when(ACTIVITY == 1 ~ 'WALKING',
                                                                       ACTIVITY == 2 ~ 'WALKING_UPSTAIRS',
                                                                       ACTIVITY == 3 ~ 'WALKING_DOWNSTAIRS',
                                                                       ACTIVITY == 4 ~ 'SITTING',
                                                                       ACTIVITY == 5 ~ 'STANDING',
                                                                       ACTIVITY == 6 ~ 'LAYING')))

data_avg <- data %>%
  group_by(ACTIVITY, SUBJECT) %>%
  summarize(across(where(is.numeric), mean))

# table(data$ACTIVITY, data$SUBJECT)

rm(list=setdiff(ls(), c("data", "data_avg")))

write.table(data_avg, 'data_avg.txt', row.names = FALSE)
