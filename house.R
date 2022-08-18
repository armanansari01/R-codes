#house data visualization

house <- read.csv(file.choose(),header=TRUE)
str(house)
library(dplyr)
#house1 <- house[,-1]
house1 <- house %>% select(c(-1))
str(house1)

#histogram
library(ggplot2)
ggplot(data=house,aes(x=price))+geom_histogram(bin=50,fill="green",col="red")
ggplot(data = house, aes(x=price,fill=factor(air_cond)))+geom_histogram(bins=50,position = "fill")       
