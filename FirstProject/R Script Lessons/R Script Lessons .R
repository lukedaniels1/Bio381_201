#Basic R command and usage 
#30 January 2018 
#Luke Daniels 

library(ggplot2)

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