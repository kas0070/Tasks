simPop()
#Look at how effective selection is when the allele is recessive versus overdominant, look at how drift and selection interact.
#recessive alleles evolve quickly, dominant evolve slowly. Drift is random chance evolution and selection is more about fitness evolution.
#Does the most fit allele go to fixation?
#no
#What combinations of drift and heritability prevent that?
#drift leads to fixation but heritability increase homozygotes but in heritability homozygotes are reproductively diadvantaged and heterzygous is around producing more variance.
#Explore these above

source("http://jonsmitchell.com/code/fxn05.R")
Pop1 <- simPop(Popsize = 50, nGenerations = 100, initial_p = 0.5, h = 1, s = 0)
plot(1: nrow(Pop1), Pop1[,1], ylim =c(0, 1), type = "l", xlab="generation", ylab ="allele freq.", lwd=2)
lines(1:nrow(Pop1), Pop1[,2], lwd=2, col='red')
legend("topleft", legend = c ("a", "b"), col = c("black", "red"), lwd=2, bty="n")
plotFit( nruns = 10, n = 50, ngens = 100, init_p = 0.5, h = 1, s = 0)

#Scientific testing
Expectation <- c(10, 10, 10, 10)
Observed <- c(15, 15, 5, 5)
Chisq <- sum((( Expectation - Observed)^ 2)/ Expectation)
barplot(rbind(Expectation, Observed), beside = T, main = bquote(chi^2 ~ "=" ~.(Chisq)), legend.text=c("expected", "observed"))

Expectation <- c(10, 10, 10, 10)
Observed <- c(2,3, 10, 30)
Chisq <- sum((( Expectation - Observed)^ 2)/ Expectation)
barplot(rbind(Expectation, Observed), beside = T, main = bquote(chi^2 ~ "=" ~.(Chisq)), legend.text=c("expected", "observed"))


Expectation <- c(10, 10, 10, 10)
Observed <- c(5, 0, 0, 35)
Chisq <- sum((( Expectation - Observed)^ 2)/ Expectation)
barplot(rbind(Expectation, Observed), beside = T, main = bquote(chi^2 ~ "=" ~.(Chisq)), legend.text=c("expected", "observed"))


Expectation <- c(10, 10, 10, 10)
Observed <- c(3, 4, 7, 32)
Chisq <- sum((( Expectation - Observed)^ 2)/ Expectation)
barplot(rbind(Expectation, Observed), beside = T, main = bquote(chi^2 ~ "=" ~.(Chisq)), legend.text=c("expected", "observed"))

Expectation <- c(10, 10, 10, 10)
Observed <- c(10, 10, 10, 10)
Chisq <- sum((( Expectation - Observed)^ 2)/ Expectation)
barplot(rbind(Expectation, Observed), beside = T, main = bquote(chi^2 ~ "=" ~.(Chisq)), legend.text=c("expected", "observed"))

Expectation <- c(10, 10, 10, 10)
Observed <- c(40, 40, 40, 40)
Chisq <- sum((( Expectation - Observed)^ 2)/ Expectation)
barplot(rbind(Expectation, Observed), beside = T, main = bquote(chi^2 ~ "=" ~.(Chisq)), legend.text=c("expected", "observed"))



#Try setting the observed vector to c(5, 0, 0, 35) and (2,3, 10, 30) and other combinations you can think of.

#What is the X^2 value when you observe all 10's?
#0
#What about when all 40 are only in one category?
#360
#How does the x^2 relate to the evenness of the bars?
#x^2 is the sum of contributions its the difference between the two,from the expected. Relates the proportion of a observational proabability of the 2 values, Whether the observed is stastical significant. The x^2 relates too the number in a category observed or expected. Each bar is x and the other is x. The bars proportion that the expectation can have from observed.


setwd("C:\\Users\\kas0070\\Desktop\\evolution\\tasks\\task_05")
results <- read.csv("http://jonsmitchell.com/data/biol112labresults.csv", stringsAsFactors=F)
#Lokk at this data ,remind yourself by looking at Task02a.
counts <- results[,c("yellow", "red", "green", "blue", "black", "tan")]
backgrounds <- c("White", "Red", "Yellow", "Green", "Blue", "Black")
backgroundCol <- c("white", "#d53e4f", "#fee08b", "#abdda4", "#3288bd", "black")

#This line calculates chi-squared for the first row of counts
calcChi(counts[1,])
#This line calculates chi-squared for all the rows at once.
Chisqs <- apply(counts, 1, calcChi)
#Use the following function multiple times
plotChis(counts)
#Look at plots, look at the chisqaure value for each panel, and the heights of the bars. 
#How "even" are the bars when the chi squared is high?
#When compared to the 10 mark the groups are not even at all as one group or color is extremely high and the other are not.
#How "even" are they when it is low?
#exactly even in regards to 10 mark.
#What does plotChis() show you about how to interpret the number a Chi-sqaured test spits out?
#It tells you that it doesnt matter the group it could be any one of the groupsor colors that is contributing to this model for each chisquare. Looking at each group individually.

#What's the average chi_sqaured?
#10
#How would you interpret thta given (many) plots you should've just looked at?
#The same y axis expected is the same value of 60. The eveness relates to the 10 or average.


#How does the average chi-squared compare to the critical value in the packet (11.70)?
#You have different degrees of freedom like 1, if the value is above that one degree of freedom you reject the null hypothesis. There is a significant difference.
#Does the chi-squared differ by background?
#no
backgroundAvgs <- tapply(Chisqs, results[,3], mean)

#Critical value is 11.70 that is if the Chi-squared number is greater than 11.70, p-value is <0.05. The difference is stastically clear.

propSig <- length( which( Chisqs > 11.70))/ length(Chisqs)
percSig <- round(100 * propSig)
#percSig tells you the percent of trails that had a significant p-value.
percSig
#Does that # suprise you?
#yes it is higher than expected.
#Do you think the only thing driving that very high number is natural selection?
#no 
#Plot Chi-squared results
par(las = 1, mar = c(4, 4, 1, 1), mgp = c(2, 0.5, 0), tck = -0.01, cex.axis=1)
hist(Chisqs, main="", xlab="chi-squared values", ylab="frequency")
#Set up empty plot to put data into
par(las = 1, mar = c(4, 4, 1, 1), mgp = c(2, 0.5, 0), tck = -0.01, cex.axis=1)
plot(1, 1, xlim=c(0, 400), ylim=c(1, 8.5), xlab="", ylab="", type="n", yaxt="n")
axis(2, at=1:length(backgrounds), labels = backgrounds)
mtext(side=1, expression(chi^2), cex=1.75, line=2.5)
#Add Histogram of the data
counter <- 1
for(i in backgrounds) {
  Data <- Chisqs[which(results[,3] == i)]
  addHist(Y=counter, Dat=Data, Color=backgroundCol[counter])
  counter <- counter + 1
}
#Add a line reprsenting the critical value
abline( v= 11.70, lty=2, lwd = 2, col='black')
#The more to the right of that line a distrubution is, the more often trials on that background were"significant"
#Do you see any meaningful differences between backgrounds?
#yes, The variability in the size of standard dev. for each the bell shaped curve versus the critical value. 
#simDraws=blind toothpick experiment random
#Running the experiment without natural selection 10,000 times.
Simulation <- simDraws(10000)
#Add those ten thousand Chi-squared simulations to a plot
addHist(Y=7, Dat=Simulation, Color="lightgray")
mtext(side=2, at=7, line=0, "simulated")
abline(v = 11.70, lty=2, lwd=2)






#What % of the time does the selection-free simulation find a "significant" (greater than 11.70) result?
#less than the others, I would say roughly 50%.
#How can the selction-free simulation produce final counts so different from the intial counts?
# Natural selection is not driving color change or difference its not influencinf fixation or extinction.




#Fit values are 1 for each toothpick colors
Fit <- c(1, 1, 1, 1, 1, 1)
names(Fit) <- 1:6
Simulation2 <- simDraws(1e4, w = Fit)
addHist(Y=8, Dat=Simulation2, Color=rgb(0,0,0,0.25))
#1 tooth pick type selected against
Fit <- c(0.1, 1, 1, 1, 1, 1)
names(Fit) <- 1:6
Simulation3 <- simDraws(1e4, w = Fit)
addHist(Y=8, Dat=Simulation3, Color=rgb(0,0,0,0.25))
#3 toothpick types selected against
Fit <- c(0.5, 0.6, 0.7, 1, 1, 1)
names(Fit) <- 1:6
Simulation4 <- simDraws(1e4, w = Fit)
addHist(Y=8, Dat=Simulation4, Color=rgb(0,0,0,0.25))
#5 selected against
Fit <- c(0.1, 0.1, 0.1, 0.1, 0.1, 1)
names(Fit) <- 1:6
Simulation5 <- simDraws(1e4, w = Fit)
addHist(Y=8, Dat=Simulation5, Color=rgb(0,0,0,0.25))
#insane selection
Fit <- c(0.1, 0.1, 0.1, 0.1, 0.1, 1)
names(Fit) <- 1:6
Simulation6 <- simDraws(1e4, w = Fit)
addHist(Y=8, Dat=Simulation6, Colo=rgb(0,0,0,0.25))
mtext(side=2, at=8, line=0, "sel.sim.")

Simulation7 <- c(Simulation2, Simulation3, Simulation4, Simulation5, Simulation6)
addHist(Y=8, Dat=Simulation7, Color=rgb(0,0,1,0.25))


#How does the mixture compare to the student generated data?
#The mixture levels out the two extremes the ones that look like they have selection and the ones that look like they have high selection making a more fit simulation of how it actually is. The students that picked the right ones on purpose and the students that picked randomely.
#Do most student groups show evidece of strong selection?
#No
#If you had to describe the relative strength of different evolutionary processes across all the groups in all the labs across all of the years, what would you say?
#both selection and drift are occur at the same time and effect significance at the same time. Each are equally as strong, varying randomly yearly.
#Inference
#What evolutionary processes are at work in the lab as done by humans?
#mutation(not as much), natural selection, genetic drift, and gene flow the colors. prinarily natural selection and genetic drift.
#What evolutionary processes are at work in the lab-as-simulated-by-the-computer?
##mutation, natural selection, genetic drift, and gene flow.
#What do the graphs tell us about the relative strength of the evolutionary processes the Bio-112 students are stimulating?
#It is not not as strong as a more random process.
#What tells you more about what processes occuring here: comparing the student numbers to a single critical value (11.70), or comparing the student numbers to the stimulated numbers?
#comparing the student numbers to the stimulated numbers
#What would that do to the x^2 values?
# Increase the x^2

