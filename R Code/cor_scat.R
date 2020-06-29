#' Scatter Correlational Plot function for Correlational Plots with ScatterPlot 
#' of variables within R 
#' 
#' This is a very manual way to make this plot and the code is for public use within the dAbL
#' Lab Members!!!

#' LOADING IN THE NECESSARY LIBRARIES
library(lattice)
library(corrgram)
library(corrplot)
library(dplyr)
library(RColorBrewer)

myscatter_lower <- function(data,
                            point_color = "blue",
                            border_color = "grey60",
                            point_size = 0.05) {
  
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
           pch = 20, col = point_color, cex = point_size)
    
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

# making the function for the plotting of the correlational matrix with the scatterplot
scatter_cor <- function(df, text_size = 0.75, psize = 0.05){
  df <- dplyr::select_if(df, is.numeric)
  order <- corrMatOrder(cor(df), order="hclust")
  corrplot(cor(df), type="upper", method="color", order = "hclust", tl.pos = "tl",
           tl.cex = text_size, tl.srt=45, col=brewer.pal(n=8, name="PuOr"))
  myscatter_lower(df[,order], point_size = psize)
}

### Testing this on a test dataset to make sure this works
test.df <- read.csv(file=file.choose())

# saving the image in the working directory folder
png("ScatCor.png", width = 6, height = 7, units = 'in', res = 300)
scatter_cor(test.df, 0.5, 0.025)
dev.off()
