#loadData is a function for creating a tidy data frame 
loadData<-function(rootPath,dataPath,test=T){
    mydataPath<-rootPath
    testPath<-dataPath
    #read features
    myFeatures<-read.table(paste(mydataPath,"features.txt",sep=""),sep="")
    meanVals<-grep("mean",myFeatures$V2) 
    stdVals<-grep("std",myFeatures$V2)
    selectedVals<-append(meanVals,stdVals)  
    
    #Read X 
    if (test==T){
      myXTest<-read.table(paste(testPath,"X_test.txt",sep=""),sep = "")
      names(myXTest)<-make.names(myFeatures[[2]])
      myXTestSelectedCols<-myXTest[,selectedVals]
      myXTestSelectedCols$Source<-"Test"
    }
    else{
      myXTest<-read.table(paste(testPath,"X_train.txt",sep=""),sep = "")
      names(myXTest)<-make.names(myFeatures[[2]])
      myXTestSelectedCols<-myXTest[,selectedVals]
      myXTestSelectedCols$Source<-"Train"
    }
    
    #Read Y 
    if (test==T){
      myYTest<-read.table(paste(testPath,"Y_test.txt",sep=""),sep = "")
    }
    else{
      myYTest<-read.table(paste(testPath,"Y_train.txt",sep=""),sep = "")
    }
    #Read subjects
    if (test==T){
      mySubjects<-read.table(paste(testPath,"Subject_test.txt",sep=""),sep="")
      myXTestSelectedCols$AcSubject<-mySubjects$V1
    }
    else{
      mySubjects<-read.table(paste(testPath,"Subject_train.txt",sep=""),sep="")
      myXTestSelectedCols$AcSubject<-mySubjects$V1
    }
    names(myYTest)<-make.names(c("ActivityID"))
    myXTestSelectedCols$ActivityID<-myYTest$ActivityID
    #Add activity labels
    myActivityLabels<-read.table(paste(mydataPath,"Activity_Labels.txt",sep=""),sep="")
    names(myActivityLabels)<-make.names(c("ActivityID","ActivityLabel"))
    myData<-merge(myXTestSelectedCols,myActivityLabels,by="ActivityID")
}
