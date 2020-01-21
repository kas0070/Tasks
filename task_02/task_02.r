


setwd("")
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
#"�..year"      "month"        "day"          "dotw"         "start_hour"   "start_minute" "end_hour"     "end_minute"   "event"        "value"       
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
dateID <- sapply(dayID, as.Date, format= "%Y-%d" , origin = "2019-04-18")

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

write.csv(beren3, "beren_new.csv", quote=F, row.names=FALSE)

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




