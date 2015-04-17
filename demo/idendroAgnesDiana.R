## Simple visualization of the result of `cluster::agnes' and
## `cluster::diana'.
##

library(cluster)

data(iris)

dx <- dist(iris[, 1:4])

# perform hierarchical clustering using `agnes'
hx.agnes <- agnes(dx)
# visualize clusters
cat('"agnes" clustering\n')
idendro(hx.agnes, iris)

# perform hierarchical clustering using `diana'
hx.diana <- diana(dx)
# visualize clusters
cat('"diana" clustering\n')
idendro(hx.diana, iris)
