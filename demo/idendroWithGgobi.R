## idendro + ggobi integration demo.
##

data(iris)

# perform hierarchical clustering analysis
hc <- hclust(dist(iris[, 1:4]))

# visualize clusters and heat map
idendro(hc, iris, ggobi = TRUE)
