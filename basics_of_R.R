mystring <- "Hellor world"
print(mystring)

#dynamic printing of user given value
val1 <- readline(prompt = "enter value")
val2 <- readline(prompt = "enter value")
p <- as.integer(val1)+as.integer(val2)
print(paste("addition of two numbers: ",p))
paste("addition of two numbers: ",p)


x<-15
y<-3

z<-x+y
a<-x-y
b<-x/y
c<-x*y

#for printing multiple values we use paste() function.
print(paste("addition of two numbers: ",z))
print(paste("subtraction of two numbers: ",a))
print(paste("division of two numbers: ",b))
print(paste("multiplication of two numbers: ",c))

#this is wrong, as it prints only single value and not the value with it
print("multiplication of two numbers: ",c)


v <- c(1,2,3,4,5)
t <- c(6,7,2) #element of t is recycled to 6,7,2,6,7 to match the size of v

print(class(v))
print(v+t)

vec1 <- c(2,1,6,7)
vec2 <- c(2,3)
vec1 + vec2 #Element of vec2 is recycled to 2,3,2,3
vec1 - 1 #Scalar 1 is recycled to 1,1,1,1

vec1/vec2
vec1*vec2


a <- 5
b <- 17

b%/%a #q
b%%a #r

v <- c(2,5.5,6)
t<-c(8,3,4)

print(v%/%t)
print(v%%t)
print(v^t)


x<-c(TRUE,FALSE,0,6)
y<-c(FALSE,TRUE,FALSE,TRUE)
print(x&y)
print(x&&y)
print(x|y)
print(x||y)

v1<-c(3,1,TRUE,2+3i)
v2<-c(4,1,FALSE,2+3i)
print(v&t)
print(v|t)


var1<-1:7
var1
var1[3]           #access 3rd element
var1[c(2,4)]      #access 2nd and 4th element
var1[-1]          #access all but not 1st element
var1[c(2,-4)]     #cannot mix +ve and -ve integers
var1[c(2.4,3.54)] #real numbers are truncated to integers

v1<-c(3,8,4,5,0,11)
v2<-c(4,11)
#v2 becomes c(4,11,4,11,4,11)
add.result <- v1+v2
print(add.result)


#modifying vector elements
x<-c(-3,-2,-1,0,1,2)
x[2] <- 0;x       #modifying second element
x[x<0] <- 5;x     #modify elements less than 0
x<-x[1:4];x       #truncate x to first 4 elements
x<-NULL
x

n = c(2,3,5)
s = c("aa","bb","cc","dd","ee")
b = c(TRUE,FALSE,TRUE,FALSE,FALSE)
y = list(n,s,b,3) # x contains copies of n,s,b
y
n

#list slicing
y[2]
#retrieve a slice with multiple members (o/p must be: - bb,ee)
y[[2]][c(2,5)]

y[c(2,4)]   #not correct as per the requirement

#reference a list member directly
y[[2]]

#can modify its content directly (update aa with ta)
y[[2]][c(1)] = "ta"
y[[2]]


#write a command to print the value cc and ee from the list 
y[[2]][c(3,5)]


#modifying the first element of the list 
y[[1]][3]<-10
y










