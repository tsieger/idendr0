## idendro + scatter plot integration demo.
##

data(iris)

# perform hierarchical clustering analysis
hc <- hclust(dist(iris[, 1:4]))

# produce a scatter plot
plot(iris$Sepal.Length, iris$Sepal.Width, ty='p', pch=19)


colorizeCallback <- function(clr) {
    # color the scatter plot according to the current clusters
    clusterColors <- c('black','red', 'green', 'blue', 'yellow', 'magenta',
        'cyan', 'darkred', 'darkgreen', 'purple', 'darkcyan')
    plot(iris$Sepal.Length, iris$Sepal.Width,
        col = clusterColors[clr + 1], ty = 'p', pch = 19)
}

# visualize clusters and heat map
idendro(hc, iris, colorizeCallback = colorizeCallback)
