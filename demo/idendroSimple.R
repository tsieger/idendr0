## Simple dendrogram demo.
##

data(iris)

# perform hierarchical clustering
hc <- hclust(dist(iris[, 1:4]))

# visualize clusters
idendro(hc)
