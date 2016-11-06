BaseURL = 'http://stat.columbia.edu/~rachel/datasets/'
BaseFileName = 'nyt'
StartNum = 1
EndNum = 31
Fileext = '.csv'
datapath = 'C:\\RProjects\\LiveSession10\\Analysis\\Data'

setwd( 'C:\\RProjects\\LiveSession10\\Analysis\\Data')
for (i in StartNum:EndNum) {
  
  finalurl = paste(BaseURL, BaseFileName, i, Fileext, sep = '')
  FinalFile = paste(BaseFileName, i,Fileext, sep = '')
  
  data = read.csv(url(finalurl))
  data$ctr = data$Clicks/data$Impressions
  data[data$Gender == 0, "Gender2"] = 'Female'
  data[data$Gender == 1, "Gender2"] = 'Male'
  data$Age_Group <- cut(data$Age, c(-Inf, 18, 24, 34, 44, 54, 64, Inf))
  levels(data$Age_Group) <- c("<18", "18-24", "25-34", "35-44", "45-54", "55-64", "65+")
  data$Day = i
  write.csv(data, FinalFile)
  if( i > 1){
    CombinedData = rbind(CombinedData,data)
  }else{
    CombinedData = data
  }
}


write.csv(CombinedData, 'CombinedData.csv')

