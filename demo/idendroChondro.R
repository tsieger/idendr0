## Visualization of spectroscopy data in dendrogram and heat map with
## cranvas scatter plot and parallel coordinate plot integrated.
##

library(hyperSpec) # chondro data
library(MASS) # parcoord

# extract data matrix
x <- chondro [[]]
# prepend 'x' in front of numeric dimnames
colnames(x)<-paste('x',colnames(x),sep='')

# HCA
dx<-dist(x)
hx<-hclust(dx)

# scatter plot
plot(x[, "x602"], x[, "x606"], pch = 19)
p1<-dev.cur()

# parallel coordinate plot
dev.new()
parcoord(x)
p2<-dev.cur()

colorizeCallback<-function(clr) {
    clusterColors<-c('black','red','green','blue','yellow','magenta',
        'cyan','darkred','darkgreen','purple','darkcyan')

    # remember the current device
    dv<-dev.cur()

    # color the scatter plot
    dev.set(p1)
    plot(x[, "x602"], x[, "x606"], pch = 19, col = clusterColors[clr + 1])

    dev.set(p2)
    parcoord(x, col = clusterColors[clr + 1])

    # restore the original current device
    dev.set(dv)
}

idendro(hx, x, colorizeCallback = colorizeCallback)
