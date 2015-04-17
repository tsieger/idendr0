## idendro + scatter plot + parallel coordinate plot integration demo.
##

library(idendr0) # idendro

data(iris)

# perform hierarchical clustering analysis
hc <- hclust(dist(iris[, 1:4]))

# produce a scatter plot
opar <- par(ask = FALSE, mai = par('mai') * c(1, 1, .5, 1))
with(iris, plot(Sepal.Length, Sepal.Width, ty = 'p', pch = 19))
scatterDevId <- dev.cur()
par(opar)

# produce a parallel coordinate plot
if (require(MASS)) {
    dev.new()
    parcoordDevId <- dev.cur()
    opar <- par(ask = FALSE, mai = par('mai') * c(.5, 1, 1, 1))
    iris.numeric <- iris
    iris.numeric$Species <- as.numeric(iris.numeric$Species)
    parcoord(iris.numeric)
    par(opar)
} else {
    parcoordDevId <- NA
}

colorizeCallback <- function(clr) {
    clusterColors <- c('black', 'red', 'green', 'blue', 'yellow', 'magenta',
        'cyan', 'darkred', 'darkgreen', 'purple', 'darkcyan')

    # remember the current device
    dv <- dev.cur()

    # color the scatter plot
    dev.set(scatterDevId)
    opar <- par(ask = FALSE, mai = par('mai') * c(1, 1, .5, 1))
    with(iris, plot(Sepal.Length, Sepal.Width, col = clusterColors[clr + 1], ty = 'p', pch=19))
    par(opar)

    # color the parallel coordinate plot
    if (!is.na(parcoordDevId)) {
        dev.set(parcoordDevId)
        opar <- par(ask = FALSE, mai = par('mai') * c(.5, 1, 1, 1))
        parcoord(iris.numeric, col = clusterColors[clr + 1])
        par(opar)
    }

    # restore the original current device
    dev.set(dv)
}

# visualize clusters and heat map
idendro(hc, iris, colorizeCallback = colorizeCallback, hscale = 1.3, vscale = 1.3)
