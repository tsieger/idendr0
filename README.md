# idendr0

'idendr0' is an interactive dendrogram that enables the user to select 
and color clusters, to zoom and pan the dendrogram, and to visualize 
the clustered data not only in a built-in heat map, but also in 'GGobi' 
interactive plots and user-supplied plots. 

idendr0 is a backport of 'idendro' (https://github.com/tsieger/idendro) 
to base R graphics and Tcl/Tk GUI.

To install:

* the latest released version: `install.packages("idendr0")`
* the latest development version: `devtools::install_github("tsieger/idendr0")`

A simple example:

    library(idendr0)
    hc <- hclust(dist(iris[, 1:4]))
    idendro(hc, iris)

![Example](/man/figures/idendr0_1.png?raw=true "Simple example.")

Integration with other plots can be seen in `demo(idendroWithScatterAndParcoord)`, 
which, in addition to the dendrogram, creates two feature space plots:

![Example](/man/figures/idendr0_2.png?raw=true "Integration with other plots.")

For more demos, please run `demo(package="idendr0")`'.

Find out more at https://github.com/tsieger/idendr0
