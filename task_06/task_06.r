install.packages(learnPopGen)
library(learnPopGen)
coalescent.plot()
coalescent.plot(n=20,ngen=25,col.order="alternating")
object<-coalescent.plot()
print(object)
plot(object)

#website:https://phytools.shinyapps.io/coalescent-plot/

#1: The number of alleles is half of the n haploid copies of a gene. So if n is 8 then 4 alleles or n is 20 then 10 alleles. In each plot I changed the bumber individuals for each graph changing the total number of alleles used.
#examples: change n  
#Diclaimer I used different n values
coalescent.plot(n=8,ngen=25,col.order="alternating")
object<-coalescent.plot()
print(object)
plot(object)

coalescent.plot(n=9,ngen=25,col.order="alternating")
object<-coalescent.plot()
print(object)
plot(object)

#2:12N. About 12 generations for any given allele.
#3: 1 on average, The variance or range can be 1-4.
#Can find average of the squared differences from the Mean. The variance is 2.
#4:These alleles or phenotypes get muutated and go to extinction once the genotype become smaller in frequencies changing the particular type of genotype constantly. The gentoypes that surive and produce more genotypes of that kind are more fit.
#5:no, that genotype has been long gone and many genotypes have evolved from that genotype.
install.packages("coala")
library("coala")
install.packages("phytools")
library("phytools")

model <- coal_model(sample_size = 5, loci_number = 10, loci_length = 500, ploidy = 2) + feat_mutation(10) + feat_recombination(10) + sumstat_trees() + sumstat_nucleotide_div()

stats <- simulate(model, nsim = 1)

stats <- simulate(model, nsim = 2)
stats <- simulate(model, nsim = 4)
stats <- simulate(model, nsim = 3)

Diversity <- stats$pi
Diversity
#no because each locus has it own measure of genetic diversity in the sim model of 1 person if using nsim 1 or any number of people.
Nloci <- length(stats$trees)
t1 <- read.tree(text=stats$trees[[1]][1])
plot(t1)
axisPhylo()
# Question 6: The number of tips is reprsented as a group that has a particular locus not an individual in this simulation.
Agel <- max(nodeHeights(t1))
t2 <- read.tree(text=stats$trees[[2]][1])
plot(t2)
axisPhylo()
#0.4 back, it causes genetic diveristy of people.No because that mutation might of fixated and then came back in different form.
#
#Question 7:Yes, There is reordering of the loci for SNPS for gentic mutation but same timeline.

par(mfrow=c(1,2))
plot(t1)
axisPhylo()
plot(t2)
axisPhylo()

compare.chronograms(t1, t2)

t1_1 <- read.tree(text=stats$trees[[1]][1])
t1_2 <- read.tree(text=stats$trees[[1]][2])
compare.chronograms(t1_1, t1_2)

for(locus in 1:Nloci) {
ntrees <- length(stats$trees[[locus]])  
for (n in 1:ntrees) {
  if (locus == 1 && n == 1) {
    outPhy <- read.tree(text=stats$trees[[locus]][n])
  }
else {
outPhy <- ape:::c.phylo(outPhy, read.tree(text=stats$tress[[locus
        ]][n]))
}
}
}

par(mfrow=c(1,1))
densityTree(outPhy)

for(locus in 1:Nloci) {
  ntrees <- length(stats$trees[[locus]])  
  for (n in 1:ntrees) {
    if (locus == 2 && n == 1) {
      outPhy <- read.tree(text=stats$trees[[locus]][n])
    }
    else {
      outPhy <- ape:::c.phylo(outPhy, read.tree(text=stats$tress[[locus
                                                                  ]][n]))
    }
  }
}

par(mfrow=c(1,1))
densityTree(outPhy)


for(locus in 2:Nloci) {
  ntrees <- length(stats$trees[[locus]])  
  for (n in 1:ntrees) {
    if (locus == 2 && n == 1) {
      outPhy <- read.tree(text=stats$trees[[locus]][n])
    }
    else {
      outPhy <- ape:::c.phylo(outPhy, read.tree(text=stats$tress[[locus
                                                                  ]][n]))
    }
  }
}

par(mfrow=c(1,1))
densityTree(outPhy)
#yes.

model3 <- coal_model(10, 50) +
  feat_mutation(par_prior("theta", sample.int(100, 1))) +
  sumstat_nucleotide_div()
stats <- simulate(model3, nsim = 40)

mean_pi <- sapply(stats, function(x) mean(x$pi))
theta <- sapply(stats, function(x) x$pars[["theta"]])
summary("mean_pi")
summary("theta")

plot(mean_pi, theta)
abline(lm(mean_pi ~ theta))



