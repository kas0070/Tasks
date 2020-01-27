
###Task 01b First, Task 02b Second, Extra Credit 1 Lastly

###Task 01b
setwd("C:\\Users\\kas0070\\Desktop\\evolution\\tasks\\task_02")

#This reads in the file. Because you've set your working directory to thje folder withur data file. you need only enter the file's name.
Data <- read.csv("http://jonsmitchell.com/data/beren.csv", stringsAsFactors=F)
#Lets examine our object
#length() is a function that, when applied to an object, tells you how many numbers are in it.

length(Data)

#nrow() and ncol() are functions that tell yopu th number of rows and columns in an object.
nrow(Data)

ncol(Data)

# colnames() will list the names of the columns, which should be helpful!
colnames(Data)

#Some columns have straightforward names (like"genus"),but others are weird.
#So what kind of data are in each column?
#take a look by using the function head(),the data is babysitting data that includes events on each day,start and end time.It includes the value or number of times that occured.ex.nap,units=the units for delivery if milk drinking ("bottle")and the caregiver of the child.
#"ï..year"      "month"        "day"          "dotw"         "start_hour"   "start_minute" "end_hour"     "end_minute"   "event"        "value"       
#[11] "units"        "caregiver"   

#head()will let you look at the first six rows of real data for all columns in the file.
head(Data)

#We can use square  brackets,[],to acess subsets of our object.
#Run the following lines one at a time. Then compare the output of
#each line to the Excel file you have open, or the output of the head() function above. What does each one show?
Data[1,]
#Row 1 of real raw data(2 on Excel) and column headers for that row.
Data[2,]
#Row 2 of real raw data(3 on Excel) and column headers for that row.
Data[1:3,]
#Row 1-3 of real data(2-4 on Excel) and column headers for those rows.
Data[1:3, 4]
#Rows 1-3 of real data(2-4 on Excel),it shows the information only on column 4 that is dotw.The date for each of the three rows.
Data[1:5 , 1:3]
#Row 1-5 of real data(2-6 on Excel),its 1:3 shows only columns 1-3 headers and information,instead of all 12.

#How would you find the date of the 257th observation?
Data[257,4]
#257 row, Column 4 (row 5 on Excel)

write.csv(Data, "raw_data.csv", quote=F)
beren <- Data


Feeds <- which(beren[,9] == "bottle")

#Now, let's store the feeds in a new object
berenMilk <- beren[Feeds,]

#Now let's LOOK at the new object!
head(berenMilk)

#How many rows are there in this new object? What does each row represent?
#The first 6 rows of the object (berenMilk) or on Excel rows (6,7,8,9,20,21) that represent the first six rows of data for the event of bottle feeding.
nrow(berenMilk)
#There is 257 rows in the new object(berenMilk)these rows say bottle under event, out of the original 938 total events.
#Each row reprsents a year,month,day,time of start(hrs,min.),time of finish(hrs, min.),event(bottle feeding),caregiver,the value and units of Milk.

#We can subset the file using the column names as well.
Feeds <- which(beren[,"event"] =="bottle")

# We can also use a dollar sign with the column name.
Feeds <- which(beren$event == "bottle")

#Confirm to yourself that each of these three ways of finding bottle events are the same and show me below how you convinced yourself that they are the were the same.
#These three ways are all different ways to ask R to subset a file using a particular column name, first= beren Milk displays all the events by the bottle milk was given.
#second=['event] == bottle is asking R to look at the events that the bottle was used, and third= beren$event == "bottle" asks R to look at the column that has an event with bottle.
#All the same thing.

#R actually understands how dates work. The way the date information is stored in the file is because, as any of you who've ever used Excel extensively know, Excel kind of loses it's mind if it 
#thinks you even mayb epossibly have date data. R doesn't do that, but because we have to his our date data from Excel, we have to do a little bit of reformatting here to get R to understand
#what's going on. Don't worry about wehat this means...

dayID <- apply(beren, 1, function(x) paste(x[1:3], collapse="-"))
dateID <- sapply(dayID, as.Date, format= "%Y-%m-%d" , origin = "2019-04-18")

#We want to record how many days old my son was for each observation. Since each observation has a date, and the one of the observations is his birth, we just find the date of his birth
#and subtract it from each of the other observations!So he was born on April 18th and he weighed on April 20th, so April 20th - April 18th should give us his age as ''2''.
beren$age <- dateID - dateID[which(beren$event =="birth")]

#Let's look at our data now
head(beren)

#Did you notice that there's an additional column, called age, at the end of this object now?Has the file itself changed? Refresh in Excel and notice it has not.We want it that way..

#Let's make a copy of our object...
beren2 <- beren

#reorganize that object so that it's sorted by date.
#applying the order()function to the "age" column will do that for
# us, and then we just subset the object (beren2) by that order.

beren3 <- beren2[order(beren2$age),]

#The above bit is very confusing. Spend some time with it. Use the 
# head() function on the beren, beren2 and beren3 objects.
head(beren2)
head(beren3)
head(beren)
#beren3 is age organized for beren2 file where he is 2 months old,beren2 and beren is age unorganized.
#come talk to me before Wed.

#save file as a CSV for later.

#Push the folder to git,do self-quiz and make sure you understand everything.

#If you type length(1)what would happen?
length(1)
#gives you the number 1 why? Reprsents Column 1 you are looking at instead of other 12.
#length(Data)?
length(Data)
#gives you the number 12 why? The data set has 12 columns
#nrow(data)?
nrow(Data)
#gives you 937 why? It tellsyou the total number of rows of raw data excluded column headers in the data.

#What's the difference between a vector and a matrix?
#vector=numbers that correspong to a single row or date.e.i.magnitude
#matrix= numbers in a particular order that reprsent multiple rows or magnitude or rows. It keeps track of these.

#Do understand the which function?
#Which() finds the row in the data that has the event of bottle or nap only and only keeps those rows.

#Can you find which rows correspond to naps?
#Yes, Naps <- which(beren[,10] == "nap")
Naps <- which(beren[,9] == "nap")

#Which dates he ate solid food on?
Dates <- which(beren[,9] == "solids")

#If I had a long list of numbers, and wanted to find out how many different numbers were in that list,how could I do it?
# 2,56,45,3,4,5,6,7,7,8,9,4,6,3,5,3

write.csv(beren3, "beren_new.csv", quote=F, row.names=FALSE)














### TASK 02b
setwd("C:\\Users\\kas0070\\Desktop\\evolution\\tasks\\task_02")
beren3 <- read.csv("beren_new.csv", stringsAsFactors=F)

#Question 1: 
#Hypothesis 1:The amount Beren eac day is postively correlated with his weight.
#Beren may have days henot feeling good and eats less or vice versa. He may be extra hungry one day and not the other day. So to say that we assume it is postively correlated most days is not entirely accurate.

#Hypothesis 2: There is a relatioship between how much Beren naps and how much he drinks each day.
#Im sure there is but we are not really testing anything!

#Hypotheis 3: The amount of milk Beren drinks in a day increases over time.
# It does as he grows.

#potential hypothesis: The duration of naps Beren has in a day decreases over time.(overtime=age)

#How much milk does Beren eat at a sitting? This tells us
Feeds <- which(beren3$event == "bottle")
avgMilk <- mean( beren3$value[Feeds])

#What are the units for this AvgMilk value?
#oz

#Why did I use the "value" column from beren3 object? What is that?
#beren3 <- beren2[order(beren2$age),] was the code in task 01b and it has the variable age in order and naps directed to the directory beren3. To get the avg milk you have to have the toal Milk drinking events which depend on the age(how amny times the baby drank milk).

#What does the set of square brackets with "feeds" inside it do here? Is it important?why?
#[Feeds],identifies the the directory Feeds <- which(beren3$event == "bottle") that has identified the event the bottle was used so when looking for avgMilk value [Feeds] identifies all the data just for event of drinking milk.

# The tapply() function takes some data (here,value) and some treatment (here,age in daya) and applies some other function (here,mean) to those data.
avgFeed <- tapply(beren3$value[Feeds], beren3$age[Feeds], mean)

# Look at the avgFeed object using the funstions and tricks you learned last time.
#Notice that the day is saved as a name. So each element tells a day and an average-amount-that-day.

#We can also look at the raw amount of milk, and the variance in the amount of milk. he's consumed each day, and the number of bottles each day.

#All we have to do is change what function we're applying, and store the output as different objects!
varFeed <- tapply(beren3$value[Feeds], beren3$age[Feeds], var)
totalFeed <- tapply(beren3$value[Feeds], beren3$age[Feeds], sum)
numFeeds <- tapply(beren3$value[Feeds] , beren3$value[Feeds] , length)

#The cor() function tells us the correlation between two sets of numbers (here,age and the amount cosumend per day). If you do ?cor you can find different options for different types of correlations.
cor(beren3$value[Feeds], beren3$age[Feeds])

#The cor.test() function works like cor(), but it conducts the appropriate test for the type of correlation you chosse (the method argument) and so returns things like a p-value.
cor.test(beren3$valu[Feeds], beren3$age[Feeds])

#It's useful to save the output of statistical tests as objects.
berenCor <- cor.test(beren3$value[Feeds], beren3$age[Feeds])

#As you can then access the p-value and other summaries of the test later.
berenCor
summary(berenCor)

#You can conduct any statistical test you've ever heard of, or that you can conceive of,in R. That's it's major strength and a big reason why we NEED to use it this semester: so you can explore things that are beyond the scope of programs you've used in the past.
#Here's a simple example,though, of doing an ANOVA in R. aov() is the ANOVA function. wilcox.test() is a Wilcox's test, ks.test() is a Kolmogorov-Smirnov test...etc etc.

#Note that the ~ is the tilde, that litle thing up beneath your Esc key on a QWERTY keyboard. In R it means "as a function of"
berenAnova <- aov(beren3$value[Feeds] ~ beren3$caregiver[Feeds])

berenAnova

#Most people dont't know what an ANOVA actually is or does. You should never use a stastical test if you dont' understand it.
#However, you should ALWAYS plot your data! Plotting in R is very easy. In fact, plots are the main strength of R.
#Let's plot how much Beren eats(value) as a function of who his caregiver was for the feeding.
boxplot( beren3$value[Feeds] ~ beren3$caregiver[Feeds], xlab= "who gave the bottle" , ylab = "amount of milk consumed (oz)")

#The code looks very similar to the ANOVA code above. We're actually doing the same thing. But in the ANOVA line, we're asking R to calcuate a specific statistic that produces a summary of the graph that you'tr looking at now.
#Even if you're having a hard time understanding this graph right now, it's probably more meaningful to you than the number the ANOVA spat out.
#But we can make much nicer and more informative graphs.

#We can edit literally anything about any plot. We can do this by telling R what parameters to use via the par() function.
#Type ?par and try to determine what the four values I editted below do.

par(las=1, mar=c(5,5,1,1), mgp=c(2, 0.5, 0), tck=-0.01)
?par

#We can then make a simple plot.
plot(as.numeric(names(totalFeed)), totalFeed, type="b", pch=16, xlab="age in days", ylab="ounces in milk")

#and we can add a horizontal line indicating the average amount of milk consumed each day, for easy comparisons.
abline(h=mean(totalFeed), lty=2, col='red')

#We can save the above graph as a pdf by doing this:
pdf("r02b-totalMilkByDay.pdf", height =4, width =4)
par(las=1, mar=c(5,5,1,1), mgp=c(2, 0.5, 0), tck=-0.01)
plot(as.numeric(names(totalFeed)), totalFeed, type="b", pch=16, xlab="age in days", ylab="ounces of milk")
abline(h=mean(totalFeed), lty=2, col='red')
dev.off()

#Now look in your working directory and you should see that there's a new PDF! You can also save R graphs as jpegs, tiffs, pngs, whatever format you wish.
#Question2:Why is the graph impossible to interpret
#The graph does not show a postive or negative correlation. The ounces of milk changed per day depending of the dAY Beren was there and how long beren was babysitting. The ounces of milk does not rpresent everyday because some days Beren was not at daycare but he still increased in age. We do not have data for the ounces of milk he drank at home. There is no real consitent data between both variables because we can not change that he will be getting older at home. He gets older but no data on his daily milk cosumption.
#Around 200+ days Beren may have been to the daycare more often then in days 250+. His age increases can not change that but the milkdata would be lost if not recorded when the child is not in daycare


source("http://jonsmitchell.com/code/plotFxn02b.R")
pdf("r02b-cumulativeMilkByTime.pdf", height =4, width =4)
par(las=1, mar=c(5,5,1,1), mgp=c(2, 0.5, 0), tck=-0.01)
plot(as.numeric(names(cumulativeFeed)), cumulativeFeed, type="b", pch=16, xlab="time of day", ylab="total milk(oz)")
abline(h=mean(cumulativeFeed), lty=2, col='red')
dev.off()


unique(beren3$event)

# Friday hypothesis: The duration of naps Beren has in a day decreases over time.(overtime=age)


#Extra Credit 1 Assignment with Task 02b
setwd("C:\\Users\\kas0070\\Desktop\\evolution\\tasks\\task_02")
beren3 <- read.csv("beren_new.csv", stringsAsFactor=F)

# Find which rows of beren3 are naps
Naps <- which(beren3$event == "nap")

# Subset beren3 using [] to only be naps, and save as beren4
beren4 <- beren3[Naps,]

startTime <- beren4$start_hour + beren4$start_minute/60
startTime[2]

head(beren4)
endTime <- beren4$end_hour + beren4$end_minute/60
startTime[1]
duration <- startTime - endTime
duration[1:6]

Totaltime <- tapply(duration, beren4$age, sum)

par(las=1, mar=c(5,5,1,1), mgp=c(2, 0.5, 0), tck=-0.1)
plot(as.numeric(names(Totaltime)), Totaltime, type="b", xlab="day", ylab="Total time")
cor(Totaltime, as.numeric(names(Totaltime)))


cor.test(beren4$age, duration)

# Extra Credit1: What is the nature of the relationship? 
#This is negliable negative correlation relationship between when the nap starts and its total duration (time of the nap). When one variable decreases, the other variable increases. 




###Task 02c
# Set up data & directory
setwd("C:\\Users\\kas0070\\Desktop\\evolution\\tasks\\task_02")
beren3 <- read.csv("beren_new.csv", stringsAsFactor=F)
onlyNaps <- beren3[which(beren3$event == "nap"),]


#hypothesis: The total number of naps per day decreases over time.

NumberNaps <- tapply(onlyNaps$age, onlyNaps$age, length)
Day <- as.numeric(names(NumberNapss))
?par
plot(Day, NumberNaps)


par( col.main = "black")

??yaxis

wilcox.test(Day, NumberNaps)
#t.test for 2 variables

mean(y)
Day[1:74]
mean()

mean(NumberNaps)
mean(NumberNaps[1:273])
sum(NumberNaps)

NumberNaps[]
#Tests the hypothesis, you can see that after day 204 at the babysitter naps decrease down to 1. The total number of naps per day decreases over time.


#save as pdf
pdf("r02c-averageNumberNaps.pdf", height =4, width =4)
plot(Day, NumberNaps)
abline(h=(NumberNaps), lty=2, col='red')
dev.off()