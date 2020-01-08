
# count NAs in columns
na_count <-sapply(inputs, function(y) sum(length(which(is.na(y)))))

#convert colum names to classic Base R (adds x to leading numbers and replaces spaces with ".")
make.names()

#ordering 
BigDig$Landuse=factor(BigDig$Landuse,levels=c("H", "C", "P"), ordered=TRUE)  #Make it factors
BigDig=BigDig[order(BigDig$Landuse, BigDig$Site, BigDig$Bottom), ] #sorting



# Copy to clipboard
write.table(FEAbimodal, "clipboard-128", sep="\t", row.names=FALSE)
#######excel Package
library(readxl)  #Included in tidyverse , dplyr , tidyr, ggplot ) 
#Import 1st sheet in Excel
read_excel("<name and extension of your file>",
           sheet="Sheet 3",        #default will import 1st sheet
           col_names= FALSE,        #default TRUE imports 1st line as header. 
           col_types = rep("text", 10))       #sets the 1st 10 columns as texts types
## getting from the clipboard
read.delim("clipboard")   #or 

x <- read.table(file = "clipboard", sep = "t", header=TRUE)


#RCRAN to Excel ()
write.xlsx(inputs, "Z:/EPLU/PINEMAP/Tier II Particle Size/test_erase.xlsx")

#Make R code that installs the packages necessary

if (!require(package, character.only=T, quietly=T)) {
  install.packages(package, repos="http://cran.us.r-project.org")
  library(package, character.only=T)
}
#For multiple packages  use

for (package in c('<package1>', '<package2>')) {
  if (!require(package, character.only=T, quietly=T)) {
    install.packages(package, repos="http://cran.us.r-project.org")
    library(package, character.only=T)
  }
}
##tidy gather and separate
library(tidyr)
iris %>%
  gather(key, Value, -Species)
# Fill in the ___ to produce to the correct iris.tidy dataset
iris.tidy <- iris %>%
  gather(key, Value, -Species) %>%
  separate(key, c("Part", "Measure"), "\\.")

#example 2
# Load the tidyr package
library(tidyr)

# Add column with unique ids (don't need to change)
iris$Flower <- 1:nrow(iris)

# Fill in the ___ to produce to the correct iris.wide dataset
iris.wide <- iris %>%
  gather(key, value, -Species, -Flower) %>%
  separate(key, c("Part", "Measure"), "\\.") %>%
  spread(Measure, value) 

#############working with colors############
# Exploring Color with RColorBrewer

# Barplot
x = c(12, 4, 21, 17, 13, 9)
barplot(x)

# RColorBrewer
browseURL("http://colorbrewer2.org/")  # Uses Flash
install.packages("RColorBrewer")
help(package = "RColorBrewer")
require("RColorBrewer")

# Show all of the palettes in a graphics window
display.brewer.all()

# To see palette colors in separate window, give number
# of desired colors and name of palette in quotes
display.brewer.pal(8, "Accent")
display.brewer.pal(4, "Spectral")

# Barplots
# Can save palette as vector or call in function
blues <- brewer.pal(6, "Blues")
barplot(x, col = blues)
barplot(x, col = brewer.pal(6, "Greens"))
barplot(x, col = brewer.pal(6, "YlOrRd"))
barplot(x, col = brewer.pal(6, "RdGy"))
barplot(x, col = brewer.pal(6, "BrBG"))
barplot(x, col = brewer.pal(6, "Dark2"))
barplot(x, col = brewer.pal(6, "Paired"))
barplot(x, col = brewer.pal(6, "Pastel2"))
barplot(x, col = brewer.pal(6, "Set3"))

# Clean up
palette("default")  # Return to default
detach("package:RColorBrewer", unload = TRUE)
rm(list = ls())  


#############general color info######
# Working with color

# Barplot
x = c(12, 4, 21, 17, 13, 9)
barplot(x)

# R specifies color in several ways
?colors
# Web page with PDFs of colors in R
browseURL("http://research.stowers-institute.org/efg/R/Color/Chart/")

# Color names
# R has names for 657 colors, arranged alphabetically except for white (first)
# "Gray" or "grey": either is acceptable
colors()  # Gives list of color names
barplot(x, col = "slategray3")

# Color numbers
# From color name's position in alphabetically-order vector of colors()
# Specify colors() [i], where i is index number in vector
barplot(x, col = colors() [102])  # darkseagreen
barplot(x, col = colors() [602])  # Back to slategray3

# RGB Triplets
# Separately specify the red, green, and blue components of the color
# By default, colors are specified in 0-1 range
# Can specify 0-255 range by adding "max = 255"
?rgb
# Can convert color names to rgb with "col2rgb"
?col2rgb
col2rgb("navyblue")  # Yields (0, 0, 128)
barplot(x, col = rgb(.54, .0, .0))  # darkred
barplot(x, col = rgb(159, 182, 205, max = 255))  # Back to slategray3

# RGB Hexcodes
# Can also use shortcut hexcodes (base 16), which are equivalent to
# RGB on the 0-255 scale, as FF in hex equals 255 in decimal
barplot(x, col = "#FFEBCD")  # blanchedalmond
barplot(x, col = "#9FB6CD")  # Back to slategray3

# MULTIPLE COLORS
# Can specify several colors (using any coding method) in vector
barplot(x, col = c("red", "blue"))  # Colors will cycle
barplot(x, col = c("red", "blue", "green", "yellow"))  # Colors will cycle

# USING COLOR PALETTES
# Palettes can be more attractive and more informative
# Easiest to use
help(package=colorspace)  # Lots of info on color spaces
?palette

# Built-in palettes
# rainbow(n, s = 1, v = 1, start = 0, end = max(1, n - 1)/n, alpha = 1)
# heat.colors(n, alpha = 1)  # Yellow through red
# terrain.colors(n, alpha = 1)  # Gray through green
# topo.colors(n, alpha = 1)  # Purple through tan
# cm.colors(n, alpha = 1)  # Blues and pinks
help(package = colorspace)
palette()
barplot(x, col = 1:6)
barplot(x, col = rainbow(6))
barplot(x, col = heat.colors(6))
barplot(x, col = terrain.colors(6))
barplot(x, col = topo.colors(6))
barplot(x, col = cm.colors(6))
palette("default")  # Return to default

rm(list = ls())  # Clean up


###Visualizing data 
# Plot 4: Add scale_color_manual to change the colors

myColors <- c(brewer.pal(3, "Dark2"), "black")
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +   #mtcars library
  geom_point() +
  stat_smooth(method = "lm", se = FALSE, span = 0.7) +
  stat_smooth(method = "loess", 
              aes(group = 1, col="All"), 
              se = FALSE, span = 0.7) +
  # Add correct arguments to scale_color_manual
  scale_color_manual("cylinders", values=myColors)  
#add mean dot 
stat_summary(fun.y = "mean", color = "red",
             size = 3, geom = "point") 

# you can attach two columns. example:
# Load lmerTest
library(lmerTest)

# Fit the model and look at its summary 
modelOut <- glmer(data=allData,cbind(Purchases, Pass)~friend+ranking+(1|city), family="binomial" )
summary( modelOut) 



###ggmap
library(ggmap)
google_map( location = c(52, 0), zoom = 6 )