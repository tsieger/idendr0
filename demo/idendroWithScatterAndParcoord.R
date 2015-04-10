## idendro + scatter plot + parallel coordinate plot integration demo.
##

data(iris)

# perform hierarchical clustering analysis
hc<-hclust(dist(iris[, 1:4]))

# produce a scatter plot
plot(iris$Sepal.Length,iris$Sepal.Width,ty='p',pch=19)
scatterDevId<-dev.cur()

# produce a parallel coordinate plot
if (require(MASS)) {
    dev.new()
    parcoordDevId<-dev.cur()
    parcoord(iris[,1:4])
} else {
    parcoordDevId<-NA
}

colorizeCallback<-function(clr) {
    clusterColors<-c('black','red','green','blue','yellow','magenta',
        'cyan','darkred','darkgreen','purple','darkcyan')

    # remember the current device
    dv<-dev.cur()

    # color the scatter plot
    dev.set(scatterDevId)
    plot(iris$Sepal.Length,iris$Sepal.Width,col=clusterColors[clr+1],ty='p',pch=19)

    # color the parallel coordinate plot
    if (!is.na(parcoordDevId)) {
        dev.set(parcoordDevId)
        parcoord(iris[,1:4],col=clusterColors[clr+1])
    }

    # restore the original current device
    dev.set(dv)
}

# visualize clusters and heat map
idendro(hc,iris,colorizeCallback=colorizeCallback)
