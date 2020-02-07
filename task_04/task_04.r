trueMean1 <- 5
trueSD1 <- 5
population1 <- rnorm(1e6, trueMean1, trueSD1)

trueMean2 <- 4
trueSD2 <- 5
population2 <- rnorm(1e6, trueMean2, trueSD2)
Size <- 50
Sample1 <- sample(population1, Size)
Sample2 <- sample(population2, Size)
boxplot(Sample1, Sample2)
#Yes they are different, population 1 is larger than population 2.(TrueMeans)
source("http://jonsmitchell.com/code/simFxn04.R")
MatGrandma <- makeFounder("grandma_mom")
MatGrandpa <- makeFounder("grandpa_mom")
PatGrandma <- makeFounder("grandma_da")
PatGrandpa <- makeFounder("grandpa_da")
Alan <- makeBaby(PatGrandma, PatGrandpa)
#Examine objects using head() and nrow() functions.
nrow(PatGrandma)
nrow(MatGrandma)

Brenda <- makeBaby(MatGrandma, MatGrandpa)

Focus <- makeBaby(Brenda, Alan)
#What should the # be?
#Half, since we recieve 23 chromsomes from mom and then another 23 from dad. Brendas 23 chromsomes should have many genes encoded that occupy approximately 20,000 loci positions.
#Varies by relationship
ToMom <- length( grep("mom", Focus))/ length( Focus)
#what should these numbers be? Do they match your expectations?
#Maternal Grandparents should share about 25% each of 23 pair set from the mother. Roughly 11 or 12 chromsomes that could have approximately 9,000-10,000 loci, but varies by relatdness.
ToMom

#
ToMomMom <- length( grep( "grandma_mom", Focus))/ length( Focus)
ToMomDad <- length( grep( "grandpa_mom", Focus))/ length( Focus)
#Is focus related to each maternal granparent? paternal grandparent? Is this what you would expect? What is the average relatdness of Focus to all 4 grandparents?
#yes,yes. I would expect Focus to have half of each chromsomes from each parent that contain DNA of each grandparent at about 25% for half recieved by the mother and then by the father.
#50% of all 46 chromsomes will be inherited from maternal and parternal grandparents but 25% totsl relatdness compared to parents on an overall scale.

Sibling_01 <- makeBaby(Brenda, Alan)
#How much DNA do you expect Focus to share with Sibling_01?
#Half of there DNA if normal siblings,so at least 10,000 genes in normal situations.
#Is that the amount actually shared?
#No actually about 1/4 to 2/4 of DNA is shared depending on if they are full siblings at 50% and half at 25%. Not considering other factors.
ToSib <- length(intersect( Focus, Sibling_01))/length( Focus )
#How many genes does Focus share with each of the 1,000 siblings?
#Still 1/4, no matter how many children they have.
ManySiblings <- replicate(1e3, length( intersect( Focus, makeBaby(Brenda, Alan)))/ length( Focus))
quantile(ManySiblings)
mean(ManySiblings)
plot(density( ManySiblings), main="", xlab="proportion shared genes")
#Please provide an explanation for why you see a range of values?
#On the x axis is the proportion of genes shared and the y axis is the density of those genes. Theres is a range of values because at 0.5 percent that is the seperation between the genes shared
#by mom and dad. As you travel down in density or the hill the the porpotion of genes shared goes to grandparents, siblings,great grandparents and half siblings. That is what is expected because no the exact same genes will be passes by many sibling sometimes it will
#be the other half of genes that wasn't shared.

#Hardy-Weinberg Equilibrium
HWE<- function(p) { 
  aa <- p^2
  ab <- 2 * p * (1-p)
  bb <- (1-p)^2
  return(c(aa=aa, ab=ab, bb=bb))
}
HWE(0.5)
plot(1, 1, type="n", xlim=c(0,1), ylim=c(0, 1), xlab="freq. allele a", ylab="geno. freq")
p <- seq(from = 0, to = 1, by = 0.01)
GenoFreq <- t(sapply(p, HWE))
lines(p, GenoFreq[,"aa"], lwd=2, col="red")

#Can you read and understand this plot?
#Frequency of the allele a is at the x axis, and the genotype frequency is y. The frency of the a allele increases as individuals will become more heterzgous even though time is not plotted here.
#What happends to the freq. of aa individuals as the frequency of the a allele increases in the population?
#aa individuals are increased and there is more homozygous indivduals.
#What happens to the aa frequency as a decreases?
#When a decreseases there are more heterzgotes Aa and less aa in the population.aa decreases.
#Is time shown of the plot?
#no, but the frequency of these alleles popping up in HWE is the way we can predict population outcomes.

#geographic space?
#no, location is not a factor here.

lines(p, GenoFreq[,"ab"], lwd=2, col="purple")
lines(p, GenoFreq[,"bb"], lwd=2, col="blue")
legend("top", legend=c("aa","ab","bb"), col=c("red","purple","blue"), lty=1, lwd=2, bty="n")

Ne <- 500
Pop <- simPop(Ne)
points(Pop[,"freqa"], Pop[,"Genotypes.aa"]/Ne, pch=21, bg="red")

#Does the frequency of the aa genotype in your population match the expectation from Hardy-Weinberg?
#yes there will be more homozygous individuals as population size is larger at 500.
Pop <- simPop(50)
points(Pop[,"freqa"], Pop[,"Genotypes.aa"]/50, pch=22, bg="red")

#What changed and why?
#The population size smaller at 50  has more homozygotes below the half way mark because of HWE expectation.More Homozygous to more heterzygous to little to no a frequency.

#Two-Allele Drift
install.packages("learnPopGen")
library(learnPopGen)

x <- genetic.drift(Ne=200, nrep=5, pause=0.001)
#Run over again watching lines? Note pattern change Ne
#If you change the population to 20 people there is more variation in the probability of a population to go extinct or fixation. The more individuals at 200 the more stable the population are and less variability of the allele A.
x <- genetic.drift(Ne=20, nrep=5, pause=0.01)

x <- genetic.drift(Ne=500, nrep=5, pause=0.01)

PopSizes <- 5:50
Samples <- rep(PopSizes, 5)
tExt <- sapply(Samples, function(x) nrow(simPop(x, 500)))
Line <- lm(tExt ~ Samples)




summary(Line)
Line$coef
plot(Samples, tExt)
abline(Line)
 #You may consider running  Line2 <- Im( tExt~Samples + 0) which one makes more sense, what does +0 do?
Line2 <- lm( tExt~Samples + 0) 
# I think it changes the y and x axis to every single individual in a population as a dot and does not seperate the population in each line.
#What do you notice looking at the graph about the distance between the points and the line as the population size increases? What does that mean to you?
#As the population size increases there is more fluxation of the A allele more fixation and extinction possibilities. That the A allele has changed or evolved.

