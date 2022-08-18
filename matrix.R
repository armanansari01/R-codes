#matrix()
#it is a 2D rectangular data set
#It can be created using a vector input

M = matrix(c('a','b','c','d','b','a'),nrow=2,ncol=3,byrow = TRUE)#here byrow meand printing elements row-wise
print(M)

#note: If we print a matrix element it will by default print columnwise

#matrix(data, nrow, ncol, byrow, dimnames)
#data is the input vector which becomes the data elements of the matrix.

#nrow is the number of rows to be created.

#ncol is the number of columns to be created.

#byrow is a logical clue. If TRUE then the input vector elements are arranged by row.

#dimname is the names assigned to the rows and columns.

# Elements are arranged sequentially by row.
M <- matrix(c(3:14), nrow = 4, byrow = TRUE)
print(M)

# Elements are arranged sequentially by column.
N <- matrix(c(3:14), nrow = 4, byrow = FALSE)
print(N)

# Define the column and row names.
rownames = c("row1", "row2", "row3", "row4")
colnames = c("col1", "col2", "col3")

P <- matrix(c(3:14), nrow = 4, byrow = TRUE, dimnames = list(rownames, colnames))
print(P)

#matrix multiplication and division
# Create two 2x3 matrices.
matrix1 <- matrix(c(3, 9, -1, 4, 2, 6), nrow = 2)
print(matrix1)

matrix2 <- matrix(c(5, 2, 0, 9, 3, 4), nrow = 2)
print(matrix2)

# Multiply the matrices.
result <- matrix1 * matrix2
cat("Result of multiplication","\n")
print(result)

# Divide the matrices
result <- matrix1 / matrix2
cat("Result of division","\n")
print(result)



#Define the column and row names
rownames = c("row1","row2","row3","row4")
colnames = c("col1","col2","col3")

#assign the row and col names after the creation of matrix
N = matrix(c(3:14),nrow = 4,byrow = TRUE,dimnames = list(rownames,colnames))
print(N)

#Access the element at 3rd col and 1st row
print(N[1,3])

#creating a matrix without using matrix function
x <- c(1,2,3,4,5,6)
class(x)

dim(x) <- c(2,3)
class(x)
x
x[c(1,2),c(2,3)]        #select rows 1 & 2 and cols 2 & 3
x[c(1,2),]              #leaving col field blank will select entire col
x[,]                    #leaving row as well as col field blank will select entire matrix
x[-1,]                  #select all rows except first
x[2,2] <- 10            # modify a single element
x[x<4] <- 0             # modify elements less than 4



#larger matrix
A =matrix(c(2,4,3,1,5,7),nrow=3,ncol = 2)
A
B = matrix(c(7,4,2),nrow = 3,ncol = 1)
B

cbind(A,B)

#Similarly, we can combine the rows of two matrices if hey have same number of cols
C = matrix(c(6,2),nrow = 1,ncol = 2)
C

rbind(A,C)












