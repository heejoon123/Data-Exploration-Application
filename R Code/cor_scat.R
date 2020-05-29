iris.df <- iris[,1:4]
library(lattice)
library(corrgram)
library(corrplot)

myscatter_lower <- function(data,
                            point_color = "blue",
                            border_color = "grey60",
                            point_size = 2) {
  
  drawcell <- function(fx, fy, datax, datay) {
    
    oldpar <- par(mar = c(0,0,0,0), bg = "white")
    on.exit(par(oldpar), add = TRUE)
    
    norm01 <- function(x) {
      xmin <- min(x)
      xmax <- max(x)
      (x - xmin) / (xmax - xmin)
    }
    
    # scatterplot
    points(fx + norm01(datax) * .8 + .1 - .5,
           fy + norm01(datay) * .8 + .1 - .5,
           pch = '.', col = point_color, cex = point_size)
    
    # border of the cell
    symbols(fx, fy, rectangles = matrix(1, 1, 2),
            add = TRUE, inches = FALSE, fg = border_color, bg = NA)
  }
  
  for (x in 1:ncol(data)) {
    for (y in x:ncol(data)) {
      if (x != y) {
        drawcell(x, ncol(data) - y + 1, data[,x], data[,y])
      }
    }
  }
  
}

myplot <- function(){
  order <- corrMatOrder(cor(iris.df), order = "hclust")
  corrplot(cor(iris.df), type="upper", method = "color", order = "hclust", tl.pos="tl",
           tl.cex = 0.75, col=brewer.pal(n=8, name="PuOr"))
