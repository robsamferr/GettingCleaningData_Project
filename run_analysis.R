# Loading plyr Library
library(plyr)
# Step 1 - Merge train, test and subjects datasets
t_xtrain <- read.table("train/X_train.txt")
t_ytrain <- read.table("train/y_train.txt")

t_xtest <- read.table("test/X_test.txt")
t_ytest <- read.table("test/y_test.txt")

sub_train <- read.table("train/subject_train.txt")
sub_test <- read.table("test/subject_test.txt")

x <- rbind(t_xtrain, t_xtest)
y <- rbind(t_ytrain, t_ytest)
sub <- rbind(sub_train, sub_test)

# Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement
features <- read.table("features.txt")
mean_std <- grep("-(mean|std)\\(\\)", features[, 2])
x <- x[, mean_std]
names(x) <- features[mean_std, 2]

# Step 3 - Uses descriptive activity names to name the activities in the data set
act <- read.table("activity_labels.txt")
y[, 1] <- act[y[, 1], 2]
names(y) <- "ACTIVITY"

# Step 4 - Appropriately labels the data set with descriptive variable names. 
names(sub) <- "SUBJECT"
xys <- cbind(x, y, sub)
avg_data <- ddply(xys, .(SUBJECT, ACTIVITY), function(x) colMeans(x[, 1:66]))

# Step 5 - From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject
write.table(avg_data, "averages_data.txt", row.name=FALSE)
