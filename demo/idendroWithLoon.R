## idendro + loon integration demo.
##

library(idendr0) # idendro
library(loon) # l_pairs, l_plot

# cluster colors
clusterColors <- c('red','green','blue','yellow','magenta','cyan','darkred','darkgreen','purple','darkcyan')
# make the loon color equal to the one used by idendro
l_setColorList(clusterColors)

data(iris)

# perform hierarchical clustering analysis
hc <- hclust(dist(iris[, 1:4]))

# create a single scatter plot and a scatter plot matrix with common linking
# group (in order to propagate the interaction in between the plots)
p <- l_plot(iris[,c(1,3)], linkingGroup='myLG')
p2 <- l_pairs(iris, linkingGroup='myLG')

# callback to colorize observations
colCb<-function(cols) {
    # color of value 0 (unselected cluster) gets rendered as light gray
    p['color']<-c('gray90',clusterColors)[1+cols]
}
# callback to fetch the currently selected observations
fetchSelCb<-function() {
    p['selected']
}

# visualize clusters and heat map
idendro(hc, iris, hscale = 1, vscale = 1.2,
    colorizeCallback = colCb, fetchSelectedCallback = fetchSelCb, clusterColors = clusterColors)
