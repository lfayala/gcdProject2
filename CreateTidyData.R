#Setting variables with paths to files
harDataPath<-"~/Documents/R Files/Getting and cleaning data/UCI HAR Dataset/"
testPath<-"~/Documents/R Files/Getting and cleaning data/UCI HAR Dataset/test/"
trainPath<-"~/Documents/R Files/Getting and cleaning data/UCI HAR Dataset/train/"
#Calling the loadData function both on test and train data
x<-loadData(harDataPath,testPath)
y<-loadData(harDataPath,trainPath,FALSE)
#Bind the test and train data
Datos<-rbind(x,y)
Sumario<-summarizedData(Datos)
write.csv(Datos,paste(harDataPath,"tydiData1.csv",sep=""),col.names = T)
write.csv(Sumario,paste(harDataPath,"tydiData2.csv",sep=""),col.names = T)
