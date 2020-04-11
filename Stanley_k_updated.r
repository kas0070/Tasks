
data=read.csv("Stanley_Katie.csv")

data
str(data)

install.packages("hypothesisdata", dep = T)
#MyRData <- read.csv("hypothesisdata.pdf", header = TRUE)
#setwd("C:\\Users\\kas0070\\Desktop\\evolution\\tasks\\project")


#Due April 3rd 
#Your analysis plan and code to produce a figure using your project data is worth 1 point and is due April 3rd. Turn this in via github in your project folder.

#Set new working directory
setwd("C:\\Users\\kas0070\\Desktop\\evolution\\tasks\\project\\data")
orthopedic_diseases_of_the_hip <- read.csv("Stanley_Katie.csv", stringsAsFactor=F)
head(orthopedic_diseases_of_the_hip)

summary(orthopedic_diseases_of_the_hip)

sorted=orthopedic_diseases_of_the_hip[order(-orthopedic_diseases_of_the_hip$dysplasia),]

names(orthopedic_diseases_of_the_hip)[3]="dysplasia"
names(orthopedic_diseases_of_the_hip)


#Make Bar plot a pdf
dev.new(width = 50, height = 20)
barplot(sorted[1:47,]$dysplasia, names= sorted[1:47,]$Breed.Species, las =2, main= 'Hip Dysplesia for different mammals' , ylab = '# of hip dysplesia individuals',col="light blue",xlab="")

nrow(sorted)

sorted[1:47,]

which(sorted$Breed.Species=="RETRIEVER LEOPARD")

sum(sorted[1:25,]$dysplasia)/sum(sorted$dysplasia)


#hostogram 
hist(orthopedic_diseases_of_the_hip$Frequency.of.HD, col="black", xlab="hip disease frequency", border="white", main="", ylab="number of breeds")

Order <- orthopedic_diseases_of_the_hip[order(orthopedic_diseases_of_the_hip$Frequency.of.HD, rev=T), "Breed.Species"]

#other option
library(ggplot2)
bp<- ggplot(orthopedic_diseases_of_the_hip, aes(x=Breed.Species, y=Frequency.of.HD)) + geom_bar(width = 1, stat = "identity")

bp + scale_x_discrete(limits=Order)

#plot
setwd("C:\\Users\\kas0070\\Desktop\\evolution\\tasks\\project\\data")
orthopedic_diseases_of_the_hip <- read.csv("Updated.csv", stringsAsFactor=F)
"Stanley_Katie_Final_Project_data.csv"

head(orthopedic_diseases_of_the_hip)
class(orthopedic_diseases_of_the_hip)
summary(orthopedic_diseases_of_the_hip)


names(orthopedic_diseases_of_the_hip)[3]="dysplasia"
names(orthopedic_diseases_of_the_hip)

install.packages("stringr")
library(stringr)

orthopedic_diseases_of_the_hip$dysplasia <- as.integer(gsub(",","",orthopedic_diseases_of_the_hip$dysplasia))
class(orthopedic_diseases_of_the_hip$dysplasia)

sorted=orthopedic_diseases_of_the_hip[order(-orthopedic_diseases_of_the_hip$dysplasia),]


dev.new(width = 50, height = 20)
barplot(sorted[1:47,]$dysplasia, names= sorted[1:47,]$Breed.Species, 
        las =2, main= 'Hip Dysplesia for different mammals' , cex.names = 0.6, 
        ylab = '# of hip dysplesia individuals',col="light blue",xlab="")

nrow(sorted)

sorted[1:47,]

which(sorted$Breed.Species=="RETRIEVER LEOPARD")

sum(sorted[1:25,]$dysplasia)/sum(sorted$dysplasia)

# Table
unique(orthopedic_diseases_of_the_hip[1])
table(orthopedic_diseases_of_the_hip[1])

