#Basic R command and usage 
#30 January 2018 
#Luke Daniels 

library(ggplot2)

install.packages("devtools")
library(devtools)
install_github("thomasp85/patchwork") 

# Using the assigment operator 
x <- 5 #preferred 
print(x) 
y = 4 #legal but not used except in function 

y <- y + 1 

plantHeight <- 5.5 
#--------------------------------------[end class 30 Jan.]

# the combine function 
z <- c(3,7,7,10) #simple atomic vector 

print(z)

typeof(z) # get the variable type 
str(z) # get structure of the variable ----provides the range of values

is.numeric(z) #logical test for variable type 
is.character(z) 

# c always "flattens" to an atomic vector 

z <- c(c(3,4),c(5,6))
print(z)

# character strings with single or double quotes
z <- c("perch", "bass", "trout", "red snapper") 
print(z)

# use both quote types for an internal quote 

z <-c("This is only 'one' character strong", 'a second string') 

str(z)

# logical TRUE FALSE 

z <- c(TRUE, TRUE, FALSE) 
is.numeric(z)
is.logical(z)

# Three properties of atomic vectors 
# Type of atomic vector 
z <- c(1,1,2.2,3.2)
typeof(z) 
is.numeric(z)

# Length of Vector 
length(z)

# Name of vector elements (optional)

z <- runif(5) #random uniform (0,1) 
names(z)

# Add names after the variable is created 

names(z) <- c("chow", "pug", "beagle", "greyhound", "akita") 
print(z) 

# add names when variable is built 
z2 <- c(gold=3.3, silver=10, lead=2) 
print(z2)
names(z2) <- NULL  #Null deletes the name vector
print(z2)
names(z2) <- c("copper", "zinc") 
print(z2) 

# Special Data Values 

# NA  for missing values 

z <- c(3.2, 3.3, NA) 
length(z) 

typeof(z[3])

# Missing values can trip up basic functions and produces NA
mean(z) 

# The most important function to bypass this 
is.na(z)   #check for missing 
!is.na(z)  # ! is the NOT operator 
mean(!is.na(z)) # WRONG!
mean(z[!is.na(z)]) #Do it this way 

#----------------------------------------

# NaN, Inf, -Inf
# Bad Results from Numeric Calculations 

z <- 0/0 
print(z) #Prints "NAN" Not a Number 

z <- 1/0 
print(z) # Return an Inf (infinite value)

z <- -1/0 
print(z) 

z <- 0/1 # OK 
print(z) 

#------------------------------

#NULL is an object that is nothing! 
z <-NULL 
typeof(z)
length(z) 
is.null(z) 

# Three properties of atomic vectors 
# Coercion 

a <- c(2.1, 2.2) 
typeof(a) 

b <- c("purple", "green") 
typeof(b) 

d <- c(a,b) 
print(d)
typeof(d)

# Hierarchy of conversion 
# logical -> integers -> double -> character 

# Using this hierachy to do clever things 

a <- runif(10) 
print(a) 
a > 0.5      # logical operation (Goes through every element in a to check if its greater than .5)

temp <- a > 0.5 # hold these logical values 
sum(temp)  #the function sum is looking for a numeric vector but this is currently a vector of logical values! 

#The logical values get converted to to integers 

#What proportion of the values are > 0.5
mean(a > 0.5)

# qualifying exam question: approximately what proportion of of obersvations from a normal 
# (0,1) variable are > 2.0 

mean(rnorm(1000000)>2.0)  #generating values, can specify mean and variation 
# This says of the 1000 values which ones are greater than 2

#--------Vectorization 

z <- c(10,20,30) 

z + 1

y <- c(1,2,3) 
z + y #element-by-element matching 

short <- c(1,2) 
z + short # what happens? 
# The vector lengths are different, the shorter one is being recycled while added to Z
z^2 

# creating vectors 
# create an empty vector 

z <- vector(mode= "numeric", length=0)
print(z) 

# add elements to empty vector

Z <- c(z,5) #don't do this in your code 
print(z) 

# instead create a vector of pre-defined length 
z <- rep(0,100) 
z[1] <- 3.3 
head(z) 

z <- rep(NA,100) 
head(z) 

typeof(z)  # There is a different NA type for every heirachy 

z[c(1,2)] <- c("Washington", 2.2) # Says put into the first two cells of z, first cell Washington, second cell 2.2 
typeof(z)
head(z)

#Alterantively if you wanted to fill in the first 20 cells 

z[c(1:20)] <- c("Washington", 2.2)  
typeof(z)
head(z)
z[1:30]

# generate a long list of names 
myVector <- runif(13) #gen 100 random uniform values 
myNames <- paste("File",seq(1:length(myVector)),".csv", sep ="") #Paste function combined character strings
  # this gives us a string of 100 commands
head(myNames)
names(myVector) <- myNames
head(myVector) 

# using rep to repeat elements and create vectors 




#---------------------------------------------End Feb. 1st 2018 

# Using rep to repeat elements and create vectors 

rep(0.5, 6) 
rep("mystring", 3) 
rep(x=0.5, times=6)
rep(times=6, x=0.5)
myVec <- c(1,2,3) 
rep(myVec, times=2)
rep(x=myVec,each = 2) 
rep(x=myVec, times=myVec)
rep(x=1:3,times=3:1)

# Seq for creating sequences

seq(from=2, to=4) 

  #Can be used to create non-integer values 
seq(from=2, to=4,by=0.5)
seq(from=2, to=4, length=7) #length is the number of elements

x <- seq(from=2, to=4, length=7)
1:length(x)  # Need to make distinction between contents and how long the vector is
seq_along(x) #faster, better
seq_len(10) #Here the input is a certain number

# Why do we want to use sequence along function? Suppose

x <- vector(mode="numeric", length = 0)
str(x)
1:length(x) #Produces bad sequence

#To prevent a loop and strange errors later use "Seq_Along"
seq_along(x) 

# using random numbers 

runif(1)

# To make the same random number generate every time 
set.seed(100) 
runif(1)
runif(n=5, min=100, max= 200)

library(ggplot2) #graphics library 
z <- runif(n=1000,min=30,max=300)
qplot(x=z)

#The other random number generator  - Random Normal Distribution 

z <- rnorm(n=1000)
qplot(x=z)

z <- rnorm(n=1000,mean=30, sd=20)
qplot(x=z) 

# Use sample function to draw from an existing vector 

longVec <- seq_len(10)
longVec 
sample(x=longVec)
sample(x=longVec, size=3) #Sample Without Replacement 

sample(x=longVec, size=3, replace=TRUE)

# We can randomly sample from atomoic vector with different weights
myWeights <- c(rep(20,5), rep(100, 5))  # Creates a vector with 20 repeated 5 times and the number 100 repeated 5 times
myWeights

sample(x=longVec, replace=TRUE, prob = myWeights) 

#subsetting of atomic vectors 

z <- c(3.1, 9.2, 1.3, 0.4, 7.5) 

# 4 ways of subsetting on positive index values 

z[2]
z[c(2,3)]

# subset on negative index values 
z[-c(2,3)] #negative in front specifies what values to hold out 

# Can also subset data by creating a boolean vector to select elements that meet a condition 

z<3  
z[z<3]  #We are inserting a vector of TRUE and FALSE's.  We get only the elements that correspond
#to those locations where it was specified 

which(z<3) #In the 3rd and 4th locations in the vector, these are the ones that meet criteria 

myCriteria <- z<3
z[myCriteria]
z[which(z<3)] #The which function will generate those particular index values

zx <- c(NA,z) # Creating new variable and we put together a missing value with a missing value in the first place
zx[zx<3] #missing values dropped 

# If we do it this way...
zx[which(zx<3)] # The missing value (NA) is dropped

## The above function is a great way to drop missing values in a data set 

# keep entire vector
z[]
z[-(length(z):(length(z)-2))]  # Translation "Get rid of 5,4 and 3 and give me whats left

# Subset on names of vector elements 
z
names(z) <- letters[seq_along(z)] # Assesing lowercase z to the names of these elements 
print(z) 

z[c("b","d","e")]

# Arithmetic Operators 
10+3
10-3
10 * 3
10 / 3
10^3
log(10) #base 2
log10(10) #base 10

# modulus operator (remainder of division) 
10 %% 3  #The remainder of 10 / 3 is 1 

#integer division 

10 %/% 3

# generate the set of all numbers from 1 to 100 that are divisible by 9 

q <- seq_len(100)  # We want code that subsets these numbers by 9 

q[q%%9 == 0] # Takes each element and divides by 9 and asks if remainder is 0
