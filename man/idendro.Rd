\name{idendro}
\alias{idendro}
\title{Interactive Dendrogram}
\description{
'idendro' is a plot enabling users to visualize a dendrogram and
inspect it interactively: to select and color clusters anywhere in
the dendrogram, to zoom and pan the dendrogram, and to visualize
the clustered data not only in a built-in heat map, but also in any
interactive plot implemented in GGobi (as available using the
'rggobi' package). The integration with GGobi (enabled using the
'ggobi' argument), but also with the user's code is implemented in
terms of two callbacks (see the 'colorizeCallback' and
'fetchSelectedCallback' arguments).
'idendro' can be used to inspect quite large dendrograms (tens
of thousands of observations, at least).

The 'idendr0' package is a lightweight backport of the 'idendro'
package. While the 'idendro' package depends on libraries not
easily available on some platforms (e.g. Windows), the 'idendr0'
package is based on platform-independent Tcl/Tk graphic widget
toolkit, and thus made widely available. However, the 'idendro'
package should be preferred, if available, for its better
interactivity and performance.
}
\usage{idendro(h, x = NULL, qx = NULL, clusters = NULL, hscale = 1.5, 
    vscale = 1.5, silent = FALSE, zoomFactor = 1/240, 
    observationAnnotationEnabled = TRUE, 
    clusterColors = c("red", "green", "blue", "yellow", "magenta", 
        "cyan", "darkred", "darkgreen", "purple", "darkcyan"), 
    unselectedClusterColor = "black", maxClusterCount = max(length(clusterColors), 
        ifelse(!is.null(clusters), max(clusters), 0)), heatmapEnabled = TRUE, 
    heatmapSmoothing = c("none", "cluster", "zoom"), 
    heatmapColors = colorRampPalette(c("#00007F", "blue", "#007FFF", "cyan", 
        "#7FFF7F", "yellow", "#FF7F00", "red", "#7F0000"))(10), 
    doScaleHeatmap = TRUE, doScaleHeatmapByRows = FALSE, 
    heatmapRelSize = 0.2, colorizeCallback = NULL, fetchSelectedCallback = NULL, 
    brushedmapEnabled = !is.null(fetchSelectedCallback), 
    brushedmapRelSize = ifelse(!is.null(x), heatmapRelSize/ncol(x), 0.05), 
    geometry = NULL, ggobi = FALSE, ggobiGlyphType = 1, ggobiGlyphSize = 1, 
    ggobiFetchingStyle = "selected", ggobiColorScheme = "Paired 12", dbg = 0, ...)}
\arguments{
  \item{h}{object of class 'stats::hclust' (or other class
convertible to class 'hclust' by the 'as.hclust' function)
describing a hierarchical clustering.
If _inversions_ in heights (see 'hclust') is detected,
the heights get fixed in a simple naive way by preserving
non-negative relative differences in the heights, but changing
negative differences to zero. Using clustering with monotone
distance measure should be considered in that case.}
  \item{x}{data frame holding observations tha were clustered
giving rise to 'h'.
The heat map will depict this data. (The heat map can be scaled
- see the 'doScaleHeatmap' and 'doScaleHeatmapByRows' arguments.)
Non-numeric types will get converted to numeric using 'as.numeric'.
This parameter is optional.}
  \item{qx}{(unused, appears for compatibility with
idendro::idendro).}
  \item{clusters}{the assignment of observations to clusters to start
with, typically the value of a previous call to 'idendro'.
A numeric vector of length of the number of observations is
expected, in which 0s denote unselected observations, and values
of i > 0 mark members of the cluster `i'.}
  \item{hscale}{horizontal scaling factor of the dendrogram
figure. As the dendrogram is implemented as a Tcl/Tk image, and
rtcltk does not support image resizing (e.g. on window
maximization), the dendrogram keeps its original size regardless
of the size of its enclosing window. Thus specifying the
hscale of more than 100\% is preferred to make the dendrogram
large enough.}
  \item{vscale}{vertical scaling factor of the dendrogram
figure. See 'hscale'.}
  \item{silent}{if TRUE, no informative messages will be shown}
  \item{zoomFactor}{the amount of zoom in/out as controlled by the
mouse wheel}
  \item{observationAnnotationEnabled}{shall the names of individual
observations (rownames of 'x') be shown next to the
dendrogram/heat map?}
  \item{clusterColors}{colors
of individual clusters}
  \item{unselectedClusterColor}{the color of unselected dendrogram
branches}
  \item{maxClusterCount}{the
maximum number of clusters user can select. If greater than the number
of 'clusterColors', cluster colors will get recycled.
This parameter affects the size of the GUI and the number of
clusters that can be selected automatically by "cutting" the
dendrogram.}
  \item{heatmapEnabled}{shall the heat map be drawn?}
  \item{heatmapSmoothing}{heat map smoothing mode,
one of
'none' - the heat map gets never smoothed, it displays the
features of all the individual observations
'cluster' - the heat map depicts the average features
for the currently selected clusters,
'zoom' - the heat map displays the average feature for each
elementary (i.e. the finest) cluster seen in the
dendrogram currently.}
  \item{heatmapColors}{heat map
color palette represented by a list of colors, e.g.
a sequential palette generated by `brewer.pal', or
`colorRampPalette(.)(.)', `gray.colors(.)', or `hsv(.)'.}
  \item{doScaleHeatmap}{scale each heat map column to the <0,1> range?
(The default is TRUE.)}
  \item{doScaleHeatmapByRows}{scale heat map rows, not columns
(The default is FALSE.)}
  \item{heatmapRelSize}{relative size of the heat map - the ratio
of the heat map width to the width of the dendrogram, the heat
map, and the brushed map. The default is 20\%.}
  \item{colorizeCallback}{callback function called when cluster
selection changes; the argument is a vector assigning color
indices (0=no color, >0 colors) to individual observations.}
  \item{fetchSelectedCallback}{callback function used to fetch
observation selection made externally. The callback must return
a boolean vector of length of the number of observations in `x'.
i-th element in the vector specifies whether given observation
is selected.}
  \item{brushedmapEnabled}{shall
brushed map be drawn? If TRUE, a column vector is drawn next to
dendrogram (and heatmap, if there is one) depicting observation
that were fetched by fetchSelectedCallback. The color of the
observations is the color of the cluster used to fetch
observations into.}
  \item{brushedmapRelSize}{relative
size of the brushed map - the ratio of the brushed map width to
the width of the dendrogram, the heat map, and the brushed map.
The default is the size of a single column in the heat map, or
5\% if there is no heatmap.}
  \item{geometry}{window geometry ("width x height + xoffset +
yoffset"). Almost useless as the dendrogram does not resize, see
the 'hscale' and 'vscale' arguments instead.}
  \item{ggobi}{plot feature space projections of `x' in ggobi
and bidirectionally integrate with the plot? (defaults to FALSE
as some users may not have ggobi available)}
  \item{ggobiGlyphType}{ggobi glyph type used to draw observations in
ggobi (defaults to a single pixel; see rggobi::glyph_type)}
  \item{ggobiGlyphSize}{size of ggobi glyphs (see rggobi::glyph_size)}
  \item{ggobiFetchingStyle}{how should we recognize
ggobi-selected observations to be fetched to idendro?
Use 'selected' to fetch observations selected by ggobi brush,
or glyph type number 2-6 to fetch observations selected by ggobi
persistent brushing with a specific glyph type.}
  \item{ggobiColorScheme}{GGobi color scheme used to
color observations in ggobi plots according to the clusters
selected in the dendrogram}
  \item{dbg}{debug level (0=none, 1=brief, 2=verbose)}
  \item{\dots}{additional graphical parameters to be passed to the
dendrogram plot.}
}
\details{'idendro' displays an interactive dendrogram enriched, optionally,
with a heat map and/or a brushed map.

The dendrogram represents the result of a hierarchical cluster
analysis performed on a set of observations (see e.g. 'hclust').
There is an axis drawn below the dendrogram displaying the "height"
of the clusters in the dendrogram.

The heat map visualizes the observations living in k-dimensional
feature space by mapping their features onto a color scale and
displaying them as rows of 'k' colored rectangles. By default,
normalization (scaling) of individual features to a common visual
scale is enabled. Scaling of observations is also supported (see the
'doScaleHeatmapByRows' argument).

The brushed map can indicate which observations are currently
selected in some external plot/tool 'idendro' is integrated
with (e.g. a GGobi scatter plot matrix). Technically speaking,
the current selection must be determined explicitly by clicking the
"fetCh selected" button (or pressing the 'Alt+C' shortcut), which
results in calling the 'fetchSelectedCallback' function (see
arguments).

The dendrogram can be zoomed and panned. To zoom in a
specific region, right click and drag in the dendrogram.
Mouse wheel can also be used to zoom in and out. To pan a zoomed
dendrogram, middle click and drag the mouse. Zooming and panning
history is available (see 'GUI').

User can select clusters manually one by one (by clicking
at individual clusters in the dendrogram), or automatically by
"cutting" the dendrogram at a specified height. To cut the
dendrogram, navigate the mouse close to the dendrogram axis
(a dashed line will appear across the dendrogram at a specified
height), and left click. Clusters just beneath the cutting
height will get selected, replacing the clusters currently
selected. Selection history is available (see 'GUI').

\emph{Graphic User interface (GUI):}

In the left part of the dendrogram window, there is a simple GUI.
In the top part of the GUI come cluster-specific controls and info
panels arranged in rows. (The number of rows is determined by the
'maxClusterCount' argument.)
In each row, there is the current cluster selector (a radio button
decorated with a cluster ID and a color code (determined by the
'clusterColors' argument)), and cluster-specific statistics: the
total number (and the ratio) of the observations in that specific
cluster out of the total number of observations, and the number
(and the ratio) of the observations in that cluster out of the
observations brushed.
The current cluster determines which color and ID will be
associated with a cluster selected in the dendrogram,
At any time, exactly one cluster is selected as the current
cluster. 

At the bottom of the GUI window, there are buttons controling
zooming, cluster selection, and heat map smoothing:

"Undo zoom" - retrieves the previous zoom region from history

"Full view" - zooms the dendrogram out maximally

"Undo selection" - retrieves the previous cluster selection from
history

"Unselect" - unselects the current cluster in the dendrogram

"Unselect all" - unselects all clusters

The "heat map smoothing" mode can be set to one of:

"none" - the heat map gets never smoothed, it displays the
features of all the individual observations

"cluster" - the heat map displays the average features for the 
currently selected clusters

"zoom" - the heat map displays the average feature for each
elementary (i.e. the finest) cluster seen in the dendrogram
currently. When the dendrogram is zoomed out maximally,
the features of all the elementary clusters (i.e. the
individual observations) are displayed. When the user zooms in
the dendrogram, such that some clusters get hidden, the
features of the observations forming the hidden clusters get
averaged.

"Quit"
}
\value{vector of colors assigned to observations. 0s denote unselected
observations, while values of i > 0 denote the cluster `i'.}

\author{Tomas Sieger}



\seealso{idendro::idendro, stats::hclust, stats::plot.hclust
}
\examples{
\donttest{
data(iris, envir = environment())
hc <- hclust(dist(iris[, 1:4]))
idendro(hc, iris)
}
# see demos for more examples
}
