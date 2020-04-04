
#old pdf/hypothesis
#install.packages("hypothesisdata", dep = T)
#MyRData <- read.csv("hypothesisdata.pdf", header = TRUE)
#setwd("C:\\Users\\kas0070\\Desktop\\evolution\\tasks\\project")

#Final plot








#Due April 3rd 
#Your analysis plan and code to produce a figure using your project data is worth 1 point and is due April 3rd. Turn this in via github in your project folder.

#Set new working directory
setwd("C:\\Users\\kas0070\\Desktop\\evolution\\tasks\\project\\data")
orthopedic_diseases_of_the_hip <- read.csv("Stanley_Katie_Final_Project_data.csv", stringsAsFactor=F)
head(orthopedic_diseases_of_the_hip)

summary(orthopedic_diseases_of_the_hip)


names(orthopedic_diseases_of_the_hip)[3]="dysplasia"
names(orthopedic_diseases_of_the_hip)


sorted=orthopedic_diseases_of_the_hip[order(-orthopedic_diseases_of_the_hip$dysplasia),]


dev.new(width = 50, height = 20)
barplot(sorted[1:47,]$dysplasia, names= sorted[1:47,]$Breed.Species, las =2, main= 'Hip Dysplesia for different mammals' , ylab = '# of hip dysplesia individuals',col="light blue",xlab="")

nrow(sorted)

sorted[1:47,]

which(sorted$Breed.Species=="RETRIEVER LEOPARD")

sum(sorted[1:25,]$dysplasia)/sum(sorted$dysplasia)


#ggplot2 

Breeds=sorted[1:47,]$Breed.Species
Number_of_hips_dysplesia=sorted[1:47,]$dysplasia
library(ggplot2)




ggplot(sorted[1:47,],aes(Breeds,Number_of_hips_dysplesia))+
   geom_bar(stat="identity")+
   theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5)) + ggtitle("Hip Dysplesia for different mammals")


#Make Bar plot a pdf
#labels cut off
dev.new(width = 50, height = 20)
par(mar=c(9.5, 5.1, 2.1, 2.0))

barplot(sorted[1:47,]$dysplasia, names= sorted[1:47,]$Breed.Species, las =2, main= 'Hip Dysplesia for different mammals' , ylab = '# of hip dysplesia individuals',col="light blue",xlab="", srt=45)

nrow(sorted)

sorted[1:47,]

which(sorted$Breed.Species=="RETRIEVER LEOPARD")

sum(sorted[1:25,]$dysplasia)/sum(sorted$dysplasia)


#new bargraph
dev.new(width = 50, height = 20)
par(mar=c(9.5, 5.1, 2.1, 2.0))

barplot(sorted[1:47,]$dysplasia, names= sorted[1:47,]$Breed.Species, las =2, main= 'Hip Dysplesia for different mammals' , ylab = '# of hip dysplesia individuals',col="light blue",xlab="", srt=45)

nrow(sorted)

sorted[1:47,]

which(sorted$Breed.Species=="RETRIEVER LEOPARD")

sum(sorted[1:25,]$dysplasia)/sum(sorted$dysplasia)


#Make Bar plot a pdf
dev.new(width = 50, height = 20)
barplot(sorted[1:47,]$dysplasia, names= sorted[1:47,]$Breed.Species, las =2, main= 'Hip Dysplesia for different mammals' , ylab = '# of hip dysplesia individuals',col="light blue",xlab="")

nrow(sorted)

sorted[1:47,]

which(sorted$Breed.Species=="RETRIEVER LEOPARD")

sum(sorted[1:25,]$dysplasia)/sum(sorted$dysplasia)




##Extra

#Make Bar plot a pdf
dev.new(width = 50, height = 20)
barplot(sorted[1:47,]$dysplasia, names= sorted[1:47,]$Breed.Species, las =2, main= 'Hip Dysplesia for different mammals' , ylab = '# of hip dysplesia individuals',col="light blue",xlab="")

nrow(sorted)

sorted[1:47,]

which(sorted$Breed.Species=="RETRIEVER LEOPARD")

sum(sorted[1:25,]$dysplasia)/sum(sorted$dysplasia)


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


#Make Bar plot a pdf
dev.new(width = 50, height = 20)
barplot(orthopedic_diseases_of_the_hip$X..of.individuals.with.hip.dysplasia, names= orthopedic_diseases_of_the_hip$Breed.Species, las =2, main= 'Hip Dysplesia' , xlab = 'Breed' , ylab = '# of hip dysplesia individuals')

#hostogram 
hist(orthopedic_diseases_of_the_hip$Frequency.of.HD, col="black", xlab="hip disease frequency", border="white", main="", ylab="number of breeds")

Order <- orthopedic_diseases_of_the_hip[order(orthopedic_diseases_of_the_hip$Frequency.of.HD, rev=T), "Breed.Species"]

#other option
library(ggplot2)
bp<- ggplot(orthopedic_diseases_of_the_hip, aes(x=Breed.Species, y=Frequency.of.HD)) + geom_bar(width = 1, stat = "identity")

bp + scale_x_discrete(limits=Order)