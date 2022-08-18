#Factors
#it will print one from the pair of vectors
#function used -> factor() & nlevels()

x=c('b','c','b','d','c','d')
y=factor(x)   #gives out single value for repetitive ones
print(y)
print(nlevels(y))



#valid strings
a <- 'Start and end with single quote'
print(a)

b <- "Start and end with double quotes"
print(b)

c <- "single quote ' in between double quotes"
print(c)

d <- 'Double quotes " in between single quote'
print(d)

#invalid strings
# e <- 'Mixed quotes" 
# print(e)
# 
# f <- 'Single quote ' inside single quote'
# print(f)
# 
# g <- "Double quotes " inside double quotes"
# print(g)


#collapse - is used to eliminate the space in between two strings. 
#But not the space within two words of one string.

a <- "Hello"
b <- 'How'
c <- "are you? "

print(paste(a,b,c))

print(paste(a,b,c, sep = "-"))

print(paste(a,b,c, sep = "", collapse = ""))








