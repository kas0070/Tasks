
source("http://jonsmitchell.com/code/simFxn.R") 
source("http://jonsmitchell.com/code/reformatData07.R")

#dim() =#columns and #of rows
#nrow() =#of rows in the data set.
#x axis is from 1998-2013.
#ylim(allele freq between 0-1 on ylim)
#rgb=color choices
#overallFreq=10,000 or more alleles frequencies.
#alleleFreqs=freq. of each allele in the overall population(freq.)but also, the difference in frequency between the overall population.
#each allele freq. over time
plot(1, 1, type="n", xlim=c(1998, 2013), ylim=c(0, 1))
s <- apply(overallFreq, 2, function(x) lines(overallFreq[,1], x, col=rgb(0,0,0,0.01)))

??alleleFreqs
dim(s)
#each allele's rescaled freq.(observed-initial freq.)over time.
rescaleFreq <- apply(overallFreq[,3:ncol(overallFreq)], 2, function(x)x- x[1])
plot(1, 1, type="n", xlim=c(1998, 2013), ylim=c(-0.25, 0.25))
s <- apply(rescaleFreq, 2, function(x) lines(overallFreq[,1], x, col=rgb(0,0,0,0.01)))

Rescale_Year <- c()
Rescale_Alleles <- c()
for (i in 3:ncol(dOver)){
  Rescale_Year <- c(Rescale_Year, overallFreq[,1])
  Vec <- overallFreq[,i]
  Init <- overallFreq[]
  Rescale_Alleles <- c(Rescale_Alleles, overallFreq[,i] - overallFreq[1,i])
}

#plot probability of a given change in frequency(y)by the year(x).(same as above plot but color coded probability density instead transparent see-through lines)
smoothScatter(Rescale_Year, Rescale_Alleles, colramp = Pal, nbin=100)
#smoothScatter() plot is a complete summary of how likely a given change in allele freq. is over a given period of time in this population. Smooth scatter plot.
#nbin=changing this function makes it smotther or more pixelated.

#simPop to stimulate popualtions

smoothScatter(Rescale_Year, Rescale_Alleles, colramp = Pal, nbin=100)
addFit(nruns = 10, n = 400, h=1, s= 0, ngens = 18, startT = 1997, simCol = "gray40", rescale = TRUE)


#Find the combination of n, h, and s for addFit() that matches empirical data(that produces changes comparable to what is seen in the scrub jay population).
#n:400
#h:1
#s:0


#d_(change of freq.)& n_(number of individuals) to determine the relative strength of the different evolutionary forces here.
#below is one example of how they can be examined:
plot(alleleFreqs$d_freq, alleleFreqs$d_imm)
points(alleleFreqs$d_freq, alleleFreqs$d_birth, col='blue')
points(alleleFreqs$d_freq, alleleFreqs$d_surv, col='red')

install.packages("hypothesisdata", dep = T)

setwd("C:\\Users\\kas0070\\Desktop\\evolution\\tasks\\project")
library(hypothesisdata)

