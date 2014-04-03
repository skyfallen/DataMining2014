#-------------------R as calculator----------------#
2 + 2
2/1.3
3.4/2
x = 3
x + 2
x = 3
2*x^2
pi

5^2-7*2

#use of functions, help inside R
log(100)
log(100, base=10)

help(log)
?log
apropos("log") #search for functions with this word
help.search("log")
example(log)




##########################################################
#Exercise 1
#Calculate an area of a circle (pi*r^2) with radius r = 5 

#Answer:
r = 5
area = pi*r^2
round(area,0)
floor(area)
ceiling(area)

##########################################################

#-------------------------Vectors------------------#
x = c(1,3,4,7) #assigning names. this vector will be stored in your directory
x
c(48,56,79) #this will not

z = rep(1,4)
z
rep(0,10)

1:4
4:1
-1:3
year = 2003:2007
year
seq(1,4)
seq(2, 8, by=2)
v = seq(0, 1, by=.1)
class(v)

seq(0, 1, length=5)
fruits = c("apples","oranges","bananas","mangos")

as.numeric(c("1","2","3"))
m = c("1","2","3", 4)
m = c(1,2,3,4,"5")

fruits[1] #first element of a vector

length(fruits) #vector length

fruits[length(fruits)]#last element of a vector

fruits[c(1,2)]
fruits[1:3]

fruits[-3]
c(x,z) #concatinate

sin(x[x>=4]+2)^2 + c(3,4)
c(3,4)/2
c(3,4)/c(8,9)

x+3
rev(y) #reverse
y = c(10,6,8,2,10)
sort(y)
order(y)

y[order(y, decreasing=TRUE)]

c(1,2,3,4)/2    
c(1,2,3,4)/c(4,3,2,1)
log(c(0.1,1,10,100), 10)



#when R tries to be smart ...
c(1,2,3,4) + c(4,3)

c(1,2,3,4) + c(4,3,2)


###########################################################
#Exercise 2
#Add to the fruit vector another vector with pear, repeated 6 times

#Answer:
pears = rep("pear",6)
c(fruits,pears)
###########################################################

#-------------------------Matrices------------------#
mx = matrix(fruits,2,2)
matrix(c(1,2,4,3,2,5,6,7,5,11,2,3),3,4)
mx2 = matrix(c(1,2,4,3,2,5,6,7,5,11,2,3),3,4, byrow=TRUE)
matrix(rep(10,10), ncol = 5)

mx2[,c(1,2)]
mx2[c(1,2),]

mx2[1,]*2
mx2[,2]


mx2[1,3]

mx2*7
mx2[,3]/2
mx2[1,] = mx2[1,]/2


mx3 = cbind(mx2,rep(0,3))

mx2[,2] = rep(3,3)
mx2[,3] = 3
cbind(mx2[,1:2],rep(3,3), mx2[,3:4])

rbind(mx2,c(0,0,0)) #why warning

rbind(mx2,c(0,0,0,0))
###########################################################
#Exercise 3
#Make a matrix 3x5, with a first row consisting of 1, second - 2 and third - 3s

#Answer:
z = matrix(c(rep(1,5),rep(2,5),rep(3,5)),ncol = 5, byrow = TRUE)

###########################################################

#-------------------------Lists------------------#
person = list(name="payal", x=2, y=9, year=1990)
person
person$name
person$x

complicated_list = list("a"= 1:4, "b"=1:3, "c"=matrix(1:4, nrow=2), "d"=search)

complicated_list[[1]]
complicated_list[[1]][1]

complicated_list$a = matrix(1, 2, 2)     # replacing a list element
complicated_list$title ='an arbitrary list' # adding an element
complicated_list$d = NULL                  # removing an element
complicated_list



#now let's deal with data frames
#empty one
empty_df = data.frame()

df = data.frame(names = c("Tom","Jerry","Spike"), year=c(1994,1998,2000), x=rep(1,3), y=c(3,5,6))
df$sum = df$x + df$y
df[,1]
df[1,3]
cbind.data.frame(df, m = c(1,2,4))
rbind.data.frame(df,df)
class(df)
###########################################################
#Exercise 5
#create your own data frame, so that the first column is vector from 1:10, 
#second is the first squared and third is the first + 10

#Answer:
new_df = data.frame(x = 1:10)
new_df$y = new_df$x^2
new_df$z = new_df$x + 10
###########################################################

#data generation
x = round(runif(100, min = 1, max = 5),0)
y = rnorm(100)
z = sample(x, size = 5, replace =TRUE) #replace = FALSE

x = 1:12
# a random permutation
sample(x)
sample(x, replace = TRUE)
hist(sample(1:10,10000, replace = TRUE))

# 100 Bernoulli trials
sample(c(0,1), 100, replace = TRUE)

hist(x)
hist(y)
hist(z)
###########################################################
#Exercise 6
#find out 2 other distributions (not uniform or normal) and generate 100 values, plot

#Answer:
#?rnorm -> link to distributions
hist(rcauchy(100))
hist(rexp(100))
###########################################################

#----Just useful commands---#
ls()
rm(empty_df)
ls()
getwd()
setwd("C:\\Users\\v-anleon\\Desktop\\Tartu_University\\DataMining2014\\Practices")
library()   # see all packages installed 
search()    # see packages currently loaded
#install.packages("ggplot2")

library(ggplot2)


x = matrix(c(1,0,1,0,1,0), ncol=2)


#Reading data
iris = read.table("C:\\Users\\v-anleon\\Desktop\\Tartu_University\\DataMining2014\\Practices\\iris.data.txt", header=TRUE, sep=',')
names(iris) = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width", "Species")
head(iris)
class(iris)
str(iris)
dim(iris)
nrow(iris)


#scan produces vector, read.csv has some additional options
#to read an R code from external file:
source('tmp.R')


library(kohonen)
install.packages("som")
library(som)

#Writing data
write.table(iris, "C:\\Users\\v-anleon\\Desktop\\Tartu_University\\DataMining2014\\Practices\\iris.data.txt", col.names = TRUE, row.names = FALSE, sep =',')



#manipulating with the data
#illustration with missing data
x = c(1,2,NA,3)
mean(x) # returns NA
mean(x, na.rm=TRUE) # returns 2

set.seed(374)
prices1 =  runif(15)
prices2 = prices1 + 0.03*rnorm(15)
prices = cbind.data.frame(prices1, prices2)
prices
# Delete 5 points from each at random.
prices1[sample(1:15, 5)] = NA
prices2[sample(1:15, 5)] = NA
prices = cbind.data.frame(prices1, prices2)

prices
prices[!complete.cases(prices),]
prices[complete.cases(prices),]

cor(prices)
?cor
cor(prices, use = 'complete.obs')

combined = prices1 #we want to replace one price with another
missing = is.na(combined)
combined[missing] <- prices2[missing]
prices_new = cbind.data.frame(prices, combined)

prices_new = na.omit(prices_new)



head(iris)
subset(iris, Sepal.Width >= 4)
subset(iris, Sepal.Width >= 4 & Petal.Length>1.4)
subset(iris, Sepal.Width >= 4 | (Species == 'Iris-versicolor' & Sepal.Width < 3))

subset(iris, Species!="Iris-versicolor" & Sepal.Width <5)


iris$flower = ifelse(iris$Sepal.Length<5, "small_flower","big_flower")
table(iris$bla_bla)



subset(tmp, sex == 'Female')
###########################################################
#Exercise 7
#explain how this dataset was created. what functions  duplicated and unique are for? 

#Answer
duplicated(tmp)
subset(tmp, duplicated(tmp)==TRUE)
unique(tmp)
###########################################################

x = c(2,3,4,5,6,9)
y = c(5,6,8,9,1,0)
plot(x,y)

#cut, cut2
library(Hmisc)
iris$Sepal.Length.bins = cut(iris$Sepal.Length, breaks = 3)
table(iris$Sepal.Length.bins, iris$Species)

aggregate(data = iris, Sepal.Length ~ Sepal.Length.bins, mean)

iris$Sepal.Length.bins = cut2(iris$Sepal.Length, m = 50)
table(iris$Sepal.Length.bins, iris$Species)
aggregate(data = iris, Sepal.Length ~ Sepal.Length.bins, mean)

#--------------------#
#how to generate train and test data
nrow(iris)
#we want to divide data 50/50 split randomly

idx_train = sample(nrow(iris), round(nrow(iris)*0.5),0)
length(idx_train)

train = iris[idx_train,]
test = iris[-idx_train,]

#iris = rbind.data.frame(iris,train) 


#for loop vs apply
for(i in 1:ncol(iris[,c(1:4)])) {
  print(c(median(iris[,i]), mean(iris[,i]), sd(iris[,i]))) 
}

apply(iris[,c(1:4)], 2, median) 
apply(iris[,c(1:4)], 2, mean)
apply(iris[,c(1:4)], 2, sd) 


ddply(iris, .(Species, Sepal.Length.bins), summarize, mean = round(mean(Petal.Width), 2), sd = round(sd(Petal.Width), 2))


###########################################################
#Exercise 8
#Simplify the following code: make it without for loop. 
set.seed(34)
users = sample(1:15, replace=TRUE)
tmp = data.frame(users)
tmp$sex = sample(c("Male","Female"),15, replace = TRUE)

tmp$bought <- rep(0, nrow(tmp))
for (i in 1:length(tmp$bought)) {
  if (tmp$sex[i] == "Female") tmp$bought[i] = 1
}
tmp$bought <- factor(tmp$bought)

#Answer
tmp$bought = ifelse(tmp$sex == 'Female', 1, 0)
##########################################################

#plotting, basic: 
#scatterplot
plot(iris$Sepal.Length, iris$Sepal.Width)
plot(iris$Sepal.Length, iris$Sepal.Width, type = 'b')
plot(iris$Sepal.Length, iris$Sepal.Width, type = 'l')
plot(iris$Sepal.Length, iris$Sepal.Width, col = 'red')
plot(iris$Sepal.Length, iris$Sepal.Width, xlab = "Sepal length", ylab = 'Sepal Width', main = 'Scatterplot', xlim = c(5.5, 8))

hist(iris$Petal.Length)

par(mfrow = c(2,2))
plot(iris$Sepal.Length, iris$Sepal.Width)
hist(iris$Petal.Length)
boxplot(iris$Species, iris$Petal.Length)
hist(iris$Petal.Width, freq = FALSE)
lines(density(iris$Petal.Width), col ='red')
par(mfrow=c(1,1))

hist(iris$Sepal.Width)


heatmap(as.matrix(iris[,c(1:4)]))

library(ggplot2)
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width))+ geom_point()
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width,color = Species))+ geom_point()
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width,color = Species, size = Petal.Width))+ geom_point()
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width))+ geom_point()+facet_grid(Species~.)


#writing your own function
f = function(x)
{
  x^3 + x^2 + x + 10
}

f(5)

newf <- function(a,b)
{
  x = runif(10,a,b)
  z = mean(x)
  return(z)
}
var= newf(5,6)
var
