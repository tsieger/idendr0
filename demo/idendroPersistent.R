## Demo on persisting the clusters selected in the dendrogram.
##

data(iris)

# perform hierarchical clustering analysis
hc <- hclust(dist(iris[, 1:4]))

# visualize clusters and heat map
clusters <- idendro(hc, iris)
# select some clusters, and quit idendro

# on next invokation, the clusters should be re-selected
idendro(hc, iris, clusters=clusters)

