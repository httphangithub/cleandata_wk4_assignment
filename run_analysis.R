setwd("~/Documents/Rcourse/course3/wk3data/assigdata")

namesvector <- read.table("./features.txt", header = FALSE)
namesvector <- mutate(namesvector, colnames = paste0(namesvector$V1, namesvector$V2))
namesvector <- namesvector[,3]
namesvector <- as.character(namesvector)
namesvector <- gsub("-", "", namesvector, fixed = TRUE)
namesvector <- gsub("(", "", namesvector, fixed = TRUE)
namesvector <- gsub(")", "", namesvector, fixed = TRUE)
namesvector <- gsub(",", "", namesvector, fixed = TRUE)

setwd("~/Documents/Rcourse/course3/wk3data/assigdata/test")
X_testdata <- read.table("./X_test.txt", header = FALSE)

names(X_testdata) <- namesvector

subject_test <- read.table("./subject_test.txt", header = FALSE)
names(subject_test) <- "subject"

activity_test <- read.table("./y_test.txt", header = FALSE)
names(activity_test) <- "activity"

X_testdata <- mutate(X_testdata, treatment = "test")
X_testdata <- cbind(subject_test, X_testdata)
X_testdata <- cbind(activity_test, X_testdata)

setwd("~/Documents/Rcourse/course3/wk3data/assigdata/train")
X_traindata <- read.table("./X_train.txt", header = FALSE)

names(X_traindata) <- namesvector

subject_train <- read.table("./subject_train.txt", header = FALSE)
names(subject_train) <- "subject"

activity_train <- read.table("./y_train.txt", header = FALSE)
names(activity_train) <- "activity"

X_traindata <- mutate(X_traindata, treatment = "train")
X_traindata <- cbind(subject_train, X_traindata)
X_traindata <- cbind(axtivity_train, X_traindata)


alldata_raw <- rbind(X_traindata, X_testdata)

alldata_meanstd <- alldata_raw[,grep(names(alldata_raw), pattern = "mean|std")]
alldata_meanstd <- cbind(alldata_raw[,c(1,2,564)], alldata_meanstd)


alldata_meanstd$activity <- gsub("1", "walking", alldata_meanstd$activity)
alldata_meanstd$activity <- gsub("2", "walking_upstairs", alldata_meanstd$activity)
alldata_meanstd$activity <- gsub("3", "walking_downstairs", alldata_meanstd$activity)
alldata_meanstd$activity <- gsub("4", "sitting", alldata_meanstd$activity)
alldata_meanstd$activity <- gsub("5", "standing", alldata_meanstd$activity)
alldata_meanstd$activity <- gsub("6","laying", alldata_meanstd$activity)


names(alldata_meanstd) <- gsub("^[0-9]+", "", names(alldata_meanstd), "")
names(alldata_meanstd) <- gsub("mean", "_mean", names(alldata_meanstd), "")
names(alldata_meanstd) <- gsub("std", "_std", names(alldata_meanstd), "")


write.table(alldata_meanstd, "./alldata_wk4.txt", sep = "\t")
read.table("./alldata_wk4.txt", header = TRUE)


alldata_wk4_melt <- melt(alldata_wk4, id = c("activity", "subject", "treatment"))
dim(alldata_wk4_melt)
alldata_wk4_dcast <- dcast(alldata_wk4_melt, activity + subject + treatment ~ variable, mean)
dim(alldata_wk4_dcast)

write.table(alldata_wk4_dcast, "./alldata_wk4_mean.txt")
read.table("./alldata_wk4_mean.txt", header = TRUE)








