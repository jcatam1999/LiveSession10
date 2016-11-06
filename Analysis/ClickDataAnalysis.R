library(ggplot2) # used for visualizations
BaseFileName = 'nyt1.csv'
setwd( 'C:\\RProjects\\LiveSession10\\Analysis\\Data')

##Get the data
data = read.csv(BaseFileName, sep = ',')
head(data)

ggplot(subset(data, Impressions>0), aes(x=Impressions, fill=Age_Group))+
  geom_histogram(binwidth=1)

ggplot(subset(data, Impressions>0), aes(x=Impressions, fill=Gender2))+
  geom_histogram(binwidth=1)

ggplot(subset(data, Clicks>0), aes(x=Day, fill=Age_Group))+
  geom_histogram(binwidth=1)

ggplot(subset(data, Age>0), aes(x=Day, fill=Gender2))+
  geom_histogram(binwidth=1)

ggplot(subset(data, ctr>0), aes(x=ctr, fill=Age_Group))+
  labs(title="Click-through rate by age group (05/01/2012)")+
  geom_histogram(binwidth=.025)