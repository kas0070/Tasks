###Task_03

install.packages("paleobioDB", dep = T)

setwd("C:\\Users\\kas0070\\Desktop\\evolution\\tasks\\task_03")
library(paleobioDB)

Taxon <- "Dinosauria"

MinMA <- 66

MaxMA <- 252

fossils <- pbdb_occurrences(base_name = Taxon, show = c("phylo", "coords", "ident"), min_ma=MinMA, max_ma=MaxMA)
##How many species are known for each time period? Set the time periods about 0-14 species by the fossil records.

Res <- 5

nspeciesOverTime <- pbdb_richness(fossils, rank = "genus", temporal_extent = c(MaxMA,MinMA), res=Res)

par(mar=c(4,5,2,1), las=1, tck=-0.01, mgp=c(2.5,0.5,0))

plot(seq(to=MaxMA, from=MinMA, length.out=nrow(nspeciesOverTime)),nspeciesOverTime[,2], xlim=c(MaxMA, MinMA), type="l", xlab="age(millions of years ago)", ylab="num. of species", main = Taxon)

newspeciesOverTime <- pbdb_orig_ext(fossils, res=5, rank="species", temporal_extent=c(MinMA, MaxMA))

par(mar=c(4,5,2,1), las=1, tck=-0.01, mgp=c(2.5,0.5,0))

plot(seq(to=MaxMA, from=MinMA, length.out =nrow(newspeciesOverTime)), newspeciesOverTime[,2], col='red')
#..
legend("topleft", legend=c("first appear", "go extinct"), col=c('black', 'red'), lty=1, bty="n")

##What do you notice about these two lines?  sequence tells everything placed on the legend on x,the comma seperates the argument for the y legend for parameters. The other line gives a key like legend to refers to the colors as first was seen or extinct in this case all went extinct.
#Is there anything that suprises you? That the first apperance was  not in the Mesozoic period it was before and it doesnt seem to completely end. All fossil records that go extinct.
##When were dinosaurs evolving the fastest? Starting at 150 and then forward in time. 14 species and forward in age of era (150-66).

OceanCol <- "light Blue"

LandCol <- "black"

Cols <- c('#fee5d9','#fcae91','#fb6a4a','#de2d26','#a50f15')

par(las=0)

pbdb_map_richness(fossils, col.ocean =OceanCol, col.int = LandCol, col.rich =Cols)

#geological time scale
#here://www.geosociety.org/documents/gsa/timescale/timescl.pdf

MinMA <- 201

MaxMA <- 252

triassic_fossils <- pbdb_occurrences(base_name = Taxon, show = c("phylo", "coords", "ident"), min_ma=MinMA, max_ma=MaxMA)

MinMA <- 145

MaxMA <- 201

jurassic_fossils <- pbdb_occurrences(base_name = Taxon, show = c("phylo", "coords", "ident"), min_ma=MinMA, max_ma=MaxMA)

MinMA <- 66

MaxMA <- 145

cretaceous_fossils <- pbdb_occurrences(base_name = Taxon, show = c("phylo", "coords", "ident"), min_ma=MinMA, max_ma=MaxMA)

dev.new(height = 7.8, width = 13)

pbdb_map_richness(cretaceous_fossils, col.ocean=OceanCol, col.int = LandCol, col.rich=Cols)

mtext(side = 3, "Cretaceous (145- 66Ma)", cex=3, line=-2)

#Is 35 species a lot or a little at the same time? yes maybe, if resources are being depleted and there is interspecefic competition for the same resources.
##How many species at once is to many? and How many is too few? We dont know that question it depend on many factors disperals,environental changes that are affecting the resources like water and food availability. It may even depend on the niche to which the different species are capable of attain to reproduce and strive together.


Taxon2 <- "Mammalia"

MinMa <- 66

MaxMa <- 252

fossils2 <- pbdb_occurrences(base_name = Taxon2, show = c("phylo", "coords", "ident"), min_ma=MinMA, max_ma=MaxMA)

nspeciesOverTime2 <- pbdb_richness(fossils2, rank = "genus", temporal_extent = c(MaxMA,MinMA), res=Res)

par(mar=c(4,5,2,1), las=1, tck=-0.01, mgp=c(2.5,0.5,0))

Col_dino <- Cols[length(Cols)]

Col_mammal <- Cols[1]

LineWidth <-2

plot(seq(to=MaxMA, from=MinMA, length.out=nrow(nspeciesOverTime)), nspeciesOverTime[,2], xlim=c(MaxMA, MinMA), type="l", xlab="age (millions of years ago)", ylab="num. of species", col=Col_dino, lwd=LineWidth)

lines(seq(to=MaxMA, from=MinMA, length.out =nrow(nspeciesOverTime2)), nspeciesOverTime2[,2], col = Col_mammal, lwd=LineWidth)
legend("topleft", legend=c(Taxon, Taxon2), col=c(Col_dino, Col_mammal), bty ="n", lwd=LineWidth)


#Extension
###Hypothesis: The number of species in the  Petromyzontida has decreased over time.
###Hypothesis 2: The number of species in the Gastropoda has a similar pattern of cycling through time.
## Makes since because Gastropoda are found on land and Petromyzontida in the sea and probably have little to no direct impact on the number of species of the different ecosystems here in this case.
setwd("C:\\Users\\kas0070\\Desktop\\evolution\\tasks\\task_03")
library(paleobioDB)
#Paleoizic Era 240 to 540 myago
# 2 groups Petromyzontida and Gastropoda
Taxon <- "Petromyzontida"

MinMA <- 240

MaxMA <- 540

fossils <- pbdb_occurrences(base_name = Taxon, show = c("phylo", "coords", "ident"), min_ma=MinMA, max_ma=MaxMA)

Res <- 5

nspeciesOverTime <- pbdb_richness(fossils, rank = "genus", temporal_extent = c(MaxMA,MinMA), res=Res)

par(mar=c(4,5,2,1), las=1, tck=-0.01, mgp=c(2.5,0.5,0))

plot(seq(to=MaxMA, from=MinMA, length.out=nrow(nspeciesOverTime)),nspeciesOverTime[,2], xlim=c(MaxMA, MinMA), type="l", xlab="age(millions of years ago)", ylab="num. of species", main = Taxon)

newspeciesOverTime <- pbdb_orig_ext(fossils, res=5, rank="species", temporal_extent=c(MinMA, MaxMA))

par(mar=c(4,5,2,1), las=1, tck=-0.01, mgp=c(2.5,0.5,0))

plot(seq(to=MaxMA, from=MinMA, length.out =nrow(newspeciesOverTime)), newspeciesOverTime[,2], col='red')

legend("topleft", legend=c("first appear", "go extinct"), col=c('black', 'red'), lty=1, bty="n")

OceanCol <- "light Blue"

LandCol <- "black"

Cols <- c('#fee5d9','#fcae91','#fb6a4a','#de2d26','#a50f15')

par(las=0)

pbdb_map_richness(fossils, col.ocean =OceanCol, col.int = LandCol, col.rich =Cols)




Taxon2 <- "Gastropoda"

MinMa <- 240

MaxMa <- 540

fossils2 <- pbdb_occurrences(base_name = Taxon2, show = c("phylo", "coords", "ident"), min_ma=MinMA, max_ma=MaxMA)

nspeciesOverTime2 <- pbdb_richness(fossils2, rank = "genus", temporal_extent = c(MaxMA,MinMA), res=Res)

par(mar=c(4,5,2,1), las=1, tck=-0.01, mgp=c(2.5,0.5,0))

Col_Petromyzontida <- Cols[length(Cols)]

Col_Gastropoda <- Cols[1]

LineWidth <-2

plot(seq(to=MaxMA, from=MinMA, length.out=nrow(nspeciesOverTime)), nspeciesOverTime[,2], xlim=c(MaxMA, MinMA), type="l", xlab="age (millions of years ago)", ylab="num. of species", col=Col_dino, lwd=LineWidth)

lines(seq(to=MaxMA, from=MinMA, length.out =nrow(nspeciesOverTime2)), nspeciesOverTime2[,2], col = Col_mammal, lwd=LineWidth)
legend("topleft", legend=c(Taxon, Taxon2), col=c(Col_dino, Col_mammal), bty ="n", lwd=LineWidth)


