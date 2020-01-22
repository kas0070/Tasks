library(swirl)
swirl()
SunshineKatie
1
2


getwd()

ls()

x <-9

ls()

dir()

list.files

list.files()

list.files

info()

nxt()

list.files()

list.files

?list.files

args(list.files)

old.dir <-
old.dir <- list.files
old.dir <- getwd()
dir.create()
dir.create("testdir")

  
dir.create("testdir")
setwd(testdir)
setwd()
setwd("testdir")
file.create("mytest.R")
ls()
list.files("mytest.R")
list.files()
file.exists("mytest.R")
file.info("mytest.R")
help
file.rename("mytest.R", "mytest2.R") 
file.copy()
help
file.copy("mytest2.R", "mytest3.R")
file.path("mytest3.R")
file.path(folder1)
help
file.path("folder1", "folder2")
?dir.create
dir.create("testdir2")
help
dir.create(file.path('testdir2', 'testdir3'), recursive = TRUE)
setwd(old.dir)
2
delete(testdir)
1
1:20
pi:10
15:1
':'
help
?':'
seq(1, 20)
seq(0, 10, by=0.5)
seq(5, 10, length=30)
my_seq <- seq(5, 10, length=30)
length(30)
length(my_seq)
1:length(my_seq)
seq(along.with = my_seq)
seq_along(my_seq)
rep(0, times = 40)
rep(c(0, 1, 2), times = 10)
rep(c(0, 1, 2), each = 10)
2
1
4
num_vect(0.5, 55, -10, 6)
help
Help
num_vect <- c(0.5, 55, -10, 6)

Help
tf <- num_vect < 1
1
2
Print(tf)
tf
num_vect >= 6
1
1
1
1
my_char <- c("My", "name", "is")
my_char
paste(my_char)
paste(my_char, collapse = " ")
c(my_char, "SunshineKatie")
my_name <- c(my_char, "Katie Stanley")
my_name
paste(my_name, collapse = " ")
paste("Hello", "world!", sep = " ")
help
paste(1:3, c("X", "Y", "Z"), sep = "")
paste(LETTERS, 1:4, sep = "-")
2
1
5
x <- c(44, NA, 5, NA)
x*3
y <- rnorm(1000)
my_data <- sample(c(y, z), 100)
my_na <- is.na(my_data)
my_na
my_data == NA 
sum(my_na)
my_data

0/0
Inf-Inf
2
1
6
x

x[1:10]
2
3
1
x[is.na(x)]
y <- x[!is.na(x)]
y

1
2
5
y[y > 0]
x[x > 0]
x[!is.na(x) & x > 0]
x[c(3, 5, 7)]
x[0]
x[c(-2, -10)]
x[-c(2, 10)] 
vect <- c(foo = 11, bar = 2, norf = NA)
vect
names(vect)
vect2 <- c(11, 2, NA)
names(vect2) <- c("foo", "bar", "norf")
identical(vect, vect2)
2
2
2
vect["bar"]
vect[c("foo", "bar")]
1
1
7
my_vector <- c(1:20)
help
info()
nxt()
my_vector<- 1:20
help
my_vector
dim(my_vector)
length(my_vector)
dim(my_vector) <- c(4, 5)

dim(my_vector)
attributes(my_vector)
my_vector
class(my_vector)
my_matrix <- my_vector
?matrix()
?matrix
my_matrix2 <- my_matrix(1:20)
help
matrix(my_matrix2 <- my-matrix(1:20))
help
my_matrix2 <- matrix(1:20) 
help
matrix(mymatrix2(1:20))
help
info()       
nxt()
matrix(my-matrix2 <- c(1:20, 4, 5))
help
my_matrix2 <- matrix(1:20, 4, 5)       
identical(my_matrix,my_matrix2)
patients <- c("Bill", "Gina", "Kelly", "Sean")
cbind(patients, my_matrix)

my_data <- data.frame(patients, my_matrix)
my_data
class(my_data)
cnames <- c("patient", "age", "weight", "bp", "rating", "test")
colnames(my_data)
colnames(my_data) <- cnames
my_data
2
1
8
True==True
help
TRUE == TRUE
(FALSE == TRUE) == FALSE
6 == 7
6 < 7
10 <= 10
3
1
4
5 != 7
5 ! 7

5 != 7
!5 == 7
3
4
2
FALSE & FALSE
TRUE & c(TRUE, FALSE, FALSE)
TRUE && c(TRUE, FALSE, FALSE)
TRUE | c(TRUE, FALSE, FALSE)
TRUE || c(TRUE, FALSE, FALSE)
5 > 8 || 6 != 8 && 4 > 3.9
1
1
1
1
1
4
1
1
3
1
isTRUE(6 > 4)
1
1
4
3
4
identical('twins', 'twins')
1
4
3
2
2
xor(5 == 6, !FALSE)
xor(5 == 6, !FALSE)
4
ints <- sample(10)
ints
ints > 5

which(ints>7)
2
3
any(ints<0)
all(ints>0)
1
2
1
9
Sys.Date()
mean(c(2, 4, 5))
info()
nxt() 
SunshineKatie
1
SunshineKatie
2
1
9

Sys.Date()
mean(c(2, 4, 5))
library(swirl)
ls()
swirl()
SunshineKatie
1
Swirl()
library(swirl)
swirl()
SunshineKatie
2
1
15
data(cars)
?cars
head(carsdata)
heahead(cars)d(data)
head(cars)
plot(cars)

?p 
plot(x = cars$speed, y = cars$dist)lot
     help
plot(x = cars$speed, y = cars$dist) 
plot(dist(x-axis))     
help     
plot(x = cars$dist, y = cars$speed)

.plot(x = cars$dist, y = cars$speed)
plot(x = cars$speed)
plot(x = cars$speed, y = cars$dist, xlab = "Speed")

plot(x = cars$speed, y = cars$stoppingdistance, xlab = "Speed")
help
plot(x = cars$speed, y = cars$dist, ylab = "Stopping Distance")
plot(x = cars$speed, y = cars$dist, xlab = "Speed", ylab = "Stopping Distance")

help
plot(cars, main = "My Plot") 
plot(cars, sub = "My Plot Subtitle")
plot(cars,col=2)
plot(cars, xlim= c(10, 15))
plot(cars, pch=2)
mtcars(data.frame)
help
data(mtcars)
boxplot()
help
?boxplot
boxplot(mpg~cyl)
help
boxplot(formula = mpg ~ cyl, data = mtcars)


hist(mtcars$mpg)
1
1
source('C:/Users/kas0070/AppData/Local/Temp/Rtmp8w1IGY/my_mean.R')
swirl()
SunshineKatie
1
library(swirl)
swirl()
SunshineKatie
1
mean(my_vector) 
n = length(my_vector)
total = sum(my_vector)
Mean = total/n
Mean = sum(my_vector)/length(my_vector)
Mean = function(X) {M = sum(X)/length(X); M}
Mean(my_vector)

my_mean <- function(my_vector) {X}
submit()
library(swirl)
swirl()
SunshineKatie
1
library(swirl)
swirl()
SunshineKatie
1
