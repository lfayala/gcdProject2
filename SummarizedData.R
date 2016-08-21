#Creating the summarized tidy dataframe
summarizedData<-function(originalData){
  library(dplyr)
  originalData$AcSubject<-factor(originalData$AcSubject)
  groupedData<-group_by(originalData,ActivityLabel,AcSubject)
  summarize_each(groupedData,funs(mean),2:79)
}