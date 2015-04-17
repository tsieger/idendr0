## Visualization of flow cytometry data in dendrogram and heat
## map, with two scatter plots integrated.
##

library(flowStats) # ITN
library(RColorBrewer) # brewer.pal
library(idendr0) # idendro

data(ITN)

# get data matrix
x <- exprs(ITN$sample03[, 1:7])
# preprocess the data
x[, 3:7] <- log10(x[, 3:7])
x <- scale(x)

# perform HCA
hx <- hclust(dist(x), method = 'average')

# plot scatter plots of selected data projections
plot(x[,"CD3"], x[,"HLADr"], pch = 19)
sp1 <- dev.cur()
dev.new()
plot(x[,"CD8"], x[,"CD4"], pch = 19)
sp2 <- dev.cur()

clusterColors <- brewer.pal(12, "Paired")

colorizeCallback <- function(clr) {
    d<-dev.cur()
    dev.set(sp1)
    plot(x[,"CD3"], x[,"HLADr"], pch = 19, col = c('black',clusterColors)[clr + 1])
    dev.set(sp2)
    plot(x[,"CD8"], x[,"CD4"], pch = 19, col = c('black',clusterColors)[clr + 1])
    dev.set(d)
}

# plot dendrogram + heat map
idendro(hx, x,
    heatmapColors = colorRampPalette(c("purple4", "blue3", "blue3", "grey",
        "grey", "orangered", "orangered", "red"))(15),
    clusterColors = clusterColors,
    colorizeCallback = colorizeCallback)

