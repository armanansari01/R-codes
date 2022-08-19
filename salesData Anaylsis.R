#preprocessing for sales data
S0 <- read.csv(file.choose(),header = TRUE, stringsAsFactors = TRUE)
str(S0)
summary(S0)
#Variables `Order.Priority`, `Sales`, `Ship.Mode`, `Profit`, `Unit.Price` and 
#`Customer.Name` have missing data.
#Delete all rows with missing data and name the new dataset as `S1`
S1 <- na.omit(S0)
View(S1)
summary(S1)
#Replace the missing values with the mean value of each variable.
S0$Sales[is.na(S0$Sales)] <- mean(S0$Sales, na.rm = TRUE)
S0$Profit[is.na(S0$Profit)] <- mean(S0$Profit, na.rm = TRUE)
S0$Unit.Price[is.na(S0$Unit.Price)] <- mean(S0$Unit.Price, na.rm = TRUE)
#Missing values for variables `Order.Priority`, `Ship.Mode` and `Customer.Name` 
#cannot be replaced by the mean value, because these variables are categorical.

#Replace the missing values with random value between min and max of each variable.

#Since missing values in S0 have been replaced with the mean value of each variable 
#in part, we need to import the dataset again to restore the missing values.
View(S0)
S0 <- read.csv(file.choose(),stringsAsFactors = TRUE)
#Replacing the missing values for numerical variables:

S0$Sales[is.na(S0$Sales)] <- runif(n = sum(is.na(S0$Sales)),
                                   min = min(S0$Sales, na.rm = TRUE),
                                   max = max(S0$Sales, na.rm = TRUE))
S0$Profit[is.na(S0$Profit)] <- runif(n = sum(is.na(S0$Profit)),
                                     min = min(S0$Profit, na.rm = TRUE),
                                     max = max(S0$Profit, na.rm = TRUE))
S0$Unit.Price[is.na(S0$Unit.Price)] <- runif(n = sum(is.na(S0$Unit.Price)),
                                             min = min(S0$Unit.Price, na.rm = TRUE),
                                             max = max(S0$Unit.Price, na.rm = TRUE))
summary(S0)
#Since categorical variables do not have min and max values, we can replace the 
#missing values for categorical variables by random value from each variable.
S0$Order.Priority[is.na(S0$Order.Priority)] <- sample(levels(S0$Order.Priority),
                                                      size = sum(is.na(S0$Order.Priority)),
                                                      replace = TRUE)
S0$Ship.Mode[is.na(S0$Ship.Mode)] <- sample(levels(S0$Ship.Mode),
                                            size = sum(is.na(S0$Ship.Mode)),
                                            replace = TRUE)
S0$Customer.Name[is.na(S0$Customer.Name)] <- sample(levels(S0$Customer.Name),
                                                    size = sum(is.na(S0$Customer.Name)),replace = TRUE)
summary(S0)
#Data Exploration
summary(S1)
sd(S1$Order.Quantity)
sd(S1$Sales)
sd(S1$Profit)
sd(S1$Unit.Price)
sd(S1$Shipping.Cost)

#Draw a boxplot for each numeric variable. Which variable(s) shows there exist 
#outliers?
par(mfrow = c(1, 2))
boxplot(S1$Order.Quantity, main = "Order Quantity")
boxplot(S1$Profit, main = "Profit")
boxplot(S1$Sales, main = "Sales")
boxplot(S1$Shipping.Cost, main = "Shipping Cost")
boxplot(S1$Unit.Price, main = "Unit Price")
par(mfrow = c(1, 1))

barplot(summary(S1$Order.Priority))

ind <- which(S1$Order.Quantity %in% boxplot.stats(S1$Order.Quantity)$out |
               S1$Sales %in% boxplot.stats(S1$Sales)$out |
               S1$Profit %in% boxplot.stats(S1$Profit)$out |
               S1$Unit.Price %in% boxplot.stats(S1$Unit.Price)$out |
               S1$Shipping.Cost %in% boxplot.stats(S1$Shipping.Cost)$out)

S2 <- S1[-ind, ]
S2

S2$Order.Priority[S2$Order.Priority == "Loww"] <- "Low"
S2$Order.Priority <- droplevels(S2$Order.Priority)
barplot(summary(S2$Order.Priority))
#Finally, we can draw the new boxplots:
par(mfrow = c(1, 2))
boxplot(S2$Order.Quantity, main = "Order Quantity")
boxplot(S2$Profit, main = "Profit")
boxplot(S2$Sales, main = "Sales")
boxplot(S2$Shipping.Cost, main = "Shipping Cost")
boxplot(S2$Unit.Price, main = "Unit Price")
par(mfrow = c(1, 1))
#Standardize all the numeric variables, using (i) z-scores(describes a value's relationship to the mean of a group of values), (ii) min-max normalization, respectively
S1$Order.Quantity <- scale(S1$Order.Quantity, center = TRUE, scale = TRUE)
S1$Sales <- scale(S1$Sales, center = TRUE, scale = TRUE)
S1$Profit <- scale(S1$Profit, center = TRUE, scale = TRUE)
S1$Unit.Price <- scale(S1$Unit.Price, center = TRUE, scale = TRUE)
S1$Shipping.Cost <- scale(S1$Shipping.Cost, center = TRUE, scale = TRUE)

S1$Order.Quantity <- (S1$Order.Quantity - min(S1$Order.Quantity)) /
  (max(S1$Order.Quantity) - min(S1$Order.Quantity))
S1$Sales <- (S1$Sales - min(S1$Sales)) /
  (max(S1$Sales) - min(S1$Sales))
S1$Profit <- (S1$Profit - min(S1$Profit)) /
  (max(S1$Profit) - min(S1$Profit))
S1$Unit.Price <- (S1$Unit.Price - min(S1$Unit.Price)) /
  (max(S1$Unit.Price) - min(S1$Unit.Price))
S1$Shipping.Cost <- (S1$Shipping.Cost - min(S1$Shipping.Cost)) /
  (max(S1$Shipping.Cost) - min(S1$Shipping.Cost))

# vector containing the names of numeric variables
vars <- c("Order.Quantity", "Sales", "Profit", "Unit.Price", "Shipping.Cost")
# Create a variable to store the row id's of outliers
outliers <- c()
# Loop through the list of numeric variables
for(i in vars){
  # Get the Min/Max values
  max <- quantile(S1[, i], 0.75) + (IQR(S1[, i]) * 1.5)
  min <- quantile(S1[, i], 0.25) - (IQR(S1[, i]) * 1.5)
  # Get the row id's of outliers
  id <- which(S1[, i] < min | S1[, i] > max)
  # Append the outliers list
  outliers <- c(outliers, id) 
}
# Rows, that contain outliers
outliers <- sort(unique(outliers))
outliers
#For *"Order Priority"* and *"Product category"* two categorical variables, construct a distribution table by R function *table()*. Make comments on the results you get.
table(S2$Order.Priority, S2$Product.Category)

hist(S2$Order.Quantity, xlab = "Order Quantity", main = "Order Quantity")
#Variable `Order Quantity` seems to be uniformly distributed between 0 and 50 with some outliers.

hist(S2$Profit, xlab = "Profit", main = "Profit")
#Variable `Profit` appears to be normally distributed because the histogram is symmetric and bell_shaped.
par(mfrow = c(1, 3))
hist(S2$Sales, xlab = "Sales", main = "Sales")
hist(S2$Shipping.Cost, xlab = "Shipping Cost", main = "Shipping Cost")
hist(S2$Unit.Price, xlab = "Unit Price", main = "Unit Price")
par(mfrow = c(1, 1))
#Variables `Sales`, `Unit Price` and `Shipping Cost` appear to be exponentially distributed since the histograms are skewed to the right.
# load library for skewness() function
#Variables *Sales*, *Shipping Cost* and *Unit Price* are obviously not normally distributed.
library(e1071)

skewness(S2$Sales)
qqnorm(S2$Sales)
qqline(S2$Sales)

skewness(log(S2$Sales))
qqnorm(log(S2$Sales))
qqline(log(S2$Sales))

skewness(S2$Shipping.Cost)
qqnorm(S2$Shipping.Cost)
qqline(S2$Shipping.Cost)

skewness(log(S2$Shipping.Cost))
qqnorm(log(S2$Shipping.Cost))
qqline(log(S2$Shipping.Cost))

skewness(S2$Unit.Price)
qqnorm(S2$Unit.Price)
qqline(S2$Unit.Price)

skewness(log(S2$Unit.Price))
qqnorm(log(S2$Unit.Price))
qqline(log(S2$Unit.Price))

S2$Profit.flag <- S2$Profit > 0
table(S2$Profit.flag)
#Derive a new numeric variable, *T.cost*, to estimate total payment by a customer (unit price * order quantity + shipping cost). Draw a histogram for new variable and comment on that.

S2$T.cost <- S2$Unit.Price * S2$Order.Quantity + S2$Shipping.Cost
hist(S2$T.cost, main = "Histogram of T.cost", xlab = "T.cost")
#Relationships between Variables
cor(S2$Shipping.Cost, S2$Order.Quantity)
plot(S2$Order.Quantity, S2$Shipping.Cost,
     xlab = "Order quantity", ylab = "Shipping cost")
#There seems to be no relationship between shipping cost and order quantity.
plot(S2$Unit.Price, S2$Profit,
     xlab = "Unit price", ylab = "Profit")
#There are many points around 0 for both variables, however there seems to be no relationship between unit price and profit.

####################################################################################################################################################################################################
#preprocessing for dataset data

dataset = read.csv(file.choose(),header = TRUE)
View(dataset)
summary(dataset)
dataset$age = ifelse(is.na(dataset$age),ave(dataset$age, FUN = function(x) 
  mean(x, na.rm = 'TRUE')),dataset$age)

dataset$salary = ifelse(is.na(dataset$salary), ave(dataset$salary, FUN = function(x) 
  mean(x, na.rm = 'TRUE')), dataset$salary)
View(dataset)
summary(dataset)


dataset$age = as.numeric(format(round(dataset$age, 0)))
dataset$nation = factor(dataset$nation, levels = c('india','germany','russia'), 
                        labels = c(1,2,3))

dataset$purchased_item = factor(dataset$purchased_item, levels = c('no','yes'),  
                                labels = c(0,1))
View(dataset)
install.packages('caTools') #install once
library(caTools) # importing caTools library
set.seed(123)
split = sample.split(dataset$purchased_item, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
training_set[,3:4] = scale(training_set[,3:4])
test_set[,3:4] = scale(test_set[,3:4])
training_set[,3:4]
test_set[,3:4]
