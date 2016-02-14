
if (!file.exists("./data")) {dir.create(".data")}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"./data/assignmentzip")
list
unzip(zipfile = "./assignmentzip")
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt",header =FALSE,sep = "")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt",header =FALSE,sep = "")
colnames(y_test) <- c("y")
sub_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt",header =FALSE,sep = "")
colnames(sub_test) <- c("sub")

test_y <- cbind(x_test,y_test)
test <- cbind(test_y,sub_test)

x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt",header =FALSE,sep = "")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt",header =FALSE,sep = "")
colnames(y_train) <- c("y")
sub_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt",header =FALSE,sep = "")
colnames(sub_train) <- c("sub")
train_y <- cbind(x_train,y_train)
train<- cbind(train_y,sub_train)
all <- rbind(test,train)

# For the 2nd part of the assignment
ft <- read.table("./data/UCI HAR Dataset/features.txt", header = FALSE,sep = "")
nm <- setNames(all,ft$V2)
names(nm)[562] <- paste("activity")
names(nm)[563] <- paste("subjct")
body_mean <- grep("^tBodyAcc-mean()", colnames(nm))
body_std <- grep("^tBodyAcc-std()", colnames(nm))
grav_mean <- grep("^tGravityAcc-mean()", colnames(nm))
grav_sd <- grep("^tGravityAcc-std()", colnames(nm))

act <- grep("^activity", colnames(nm))
sub <- grep("^subjct", colnames(nm))

mean <- nm[,cbind(body_mean,grav_mean)]
mean_sd <-nm[,cbind(body_mean,body_std,grav_mean,grav_sd)]


# for the 3 part of the assignment
data_set <- cbind(nm[562:563],mean)
activity_la <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header = FALSE)
index <- match(all$y, activity_la$V1)
activityname <- activity_la[index,2]
t <- data.frame(data_set,activityname)
data_set <- subset(t,select = c(subjct,activityname,timeBodyAccmeanX:timeGravityAccmeanZ))

# For the 4 part of assignment
colnames(data_set) <- gsub("^t","time",colnames(data_set),perl=FALSE )        
colnames(data_set)<- gsub("^f","freq",colnames(data_set),perl=FALSE )
colnames(data_set) <- gsub("[-]|[()]","",colnames(data_set), perl=FALSE)

library(dplyr)
# For the 5th part of the assignment             
data_summary <- data_set %>%
        group_by(subjct,activityname) %>%
        summarize_each(funs(mean),timeimeBodyAccmeanX:timeimeGravityAccmeanZ)
write.table(data_summary,file ="tidy_data.txt",sep = " ", row.names = FALSE)

