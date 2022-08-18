print(getwd())

setwd("C:/Users/arman/OneDrive/Desktop/Predective analysis/Analysis")
print(getwd())
data <- read.csv("sales dataset.csv")
View(data)


#import data set
library(readr)
sales_dataset<-read_csv("sales dataset.csv")
View(sales_dataset)
print(is.data.frame(sales_dataset))
print(ncol(sales_dataset))
print(nrow(sales_dataset))


#get the max sale amount
sale <- max(sales_dataset$Sales_Amt)
print(sale)

#get all the details those having max sales
retval <- subset(sales_dataset,Sales_Amt == max(Sales_Amt))
View(retval)

#fetch only the details finance dept
fin <- subset(sales_dataset,Department == 'Finance')
View(fin)

#fetch the details for finance dept who have sales amount greater than 1000
res <- subset(subset(sales_dataset,Department == 'Finance'),Sales_Amt > 1000)
View(res)


newdata <- subset(sales_dataset,sales_dataset$Sales_Amt > 1000 &
                    sales_dataset$Department == 'Finance',
                  select = c("Employee Name","Employee Country"))
View(newdata)

#fetch all the details after 1 jan 2014
#default format of date in R is yyyy-mm-dd
info <- subset(sales_dataset,as.Date(sales_dataset$`Sales Date`,"%d-%m-%Y")
               > as.Date("01-01-2014","%d-%m-%Y"))
View(info)





















