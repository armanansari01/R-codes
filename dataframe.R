#data frame
# create  a,b,c,d variables
a<-c(10,20,30,40)
b<-c('book','pen','textbook','pencil_case')
c<-c(TRUE,FALSE,TRUE,FALSE)
d<-c(2.5,8,10,7)

#join the variables to create a data frame
df<-data.frame(a,b,c,d)
df

#name the data frame
names(df)<- c('Id','Items','store','price')
df
str(df)           
df[1,2]
df[1:2,]
df[,1]
df[1:3,3:4]
