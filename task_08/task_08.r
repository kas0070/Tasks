library("phytools")
library("ape")
#input tree
#hand enter trees below
text.string<-
"(((((((cow, pig),whale),(bat,(lemur,human))),(robin,iguana)),coelacanth),(gold_fish, trout)),shark);"  
vert.tree<-read.tree(text=text.string)
#plot tree
plot(vert.tree, edge.width=2)

# the number of nodes that seperate 2 lineages reflects how distantly they are.


nodelabels(frame="circle", bg='white', cex=1)

#Q1:What's more closely related to the goldfish, a shark or a human?
##Shark, based on the # of nodes.(Less Nodes ^look above)

#phylo object does not give structural memory


#object look at
vert.tree

#Q2:Are there any branch lengths on this tree?
##no branch lengths in this tree because the object vert.tree informs us.

#Simply tree to explain object "phylo" below
str(vert.tree)
tree<-read.tree(text="(((A,B),(C,D)),E);")
plotTree(tree,offset=1)
tiplabels(frame="circle", bg='lightblue', cex=1)
nodelabels(frame="circle", bg='white', cex=1)

#labeling the (A-E) using
tree$tip.label

#phylo matrix (each line on tree is called an edge so each row corresponds to the lines)
tree$edge

#each line is called an edge.
#The first number is where the line starts[,1] and the second[,2] is where the line ends.

#phylogeny of Anolis lizards
AnolisTree <- force.ultrametric(read.tree("http://jonsmitchell.com/data/anolis.tre"))

#This one unlike the previous on ehas lengths associated with each edge.

par(las=1)
hist(AnolisTree$edge.length, col='black', border='white', main="", xlab="edge lengths for the Anolis tree", ylim=c(0, 50), xlim=c(0, 6))

tipEdges <- which(AnolisTree$edge[,2] <= Ntip(AnolisTree))
Lengths <- AnolisTree$edge.length
names(Lengths) <- AnolisTree$tip.label
names(Lengths)[which(Lengths == min(Lengths))]

plot(AnolisTree, cex=0.25)
Labs <- sapply(AnolisTree$edge.length, round, digits=2)
edgelabels(text=Labs, cex=0.25)

?plot.phylo
#plot A tree with no tip labels.
#Q3:

plot(AnolisTree, show.tip.label = FALSE)

#plot a tree as a circle instead of facing right or left.
#Q4:
plot(AnolisTree, type = "radial")
#plot a tree with the tips colored red insteade of black
#Q5:
plot(AnolisTree, tip.color = "red")
#use which() function in combination.

#Q6: Anolis_opalinus
AnolisTree[which(tree$edge >1)]
#[15]edge$length smallest #
#$tip.label [13-18], [15]=Anolis_opalinus

#Q7:
tips2remove = c("Anolis_opalinus")

#Q8:
Anolis_pruned <- drop.tip(AnolisTree, tips2remove)


plot(Anolis_pruned, tip.color = "blue")

#ltt plot=lineage through time looks at how fast the species appeared.
ltt(AnolisTree)
abline(0, 1, lwd=2, col='red', lty=2)

#Q9:Question 9 is missing on the r assignment but these questions are present
#The line is inbetween the data,no does not go down, why? convergent evolution. No the slope will not be the same once it crosses the data line, converges. Then the slope is a negative reciprocal.
#The slope tells me there was a slower evolution where species split took more time and then fast rapid evolution of indivial groups in less time.
#The negative slope helps indicate this that one increases and one decreases. These two variable are time and speciation.

#Q10:
bd <- fit.bd(AnolisTree, b=NULL, d=NULL, rho=0.2)
yule <- fit.yule(AnolisTree, b=NULL, d=NULL, rho=0.02)
AIC(bd, yule)
#Rate:0.8031 new species form and disappear in lizards.

