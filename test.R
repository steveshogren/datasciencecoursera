# emacs use R-mode
# enable repl SPC msi
# compile buffer repl SPC msb


bubba <- c(3,5,7,9)
heisenbeg <- read.csv(file="simple.csv",head=TRUE,sep=",")

# > heisenbeg
#   trial mass velocity
# 1     A 10.0       12
# 2     A 11.0       14
# 3     B  5.0        8
# 4     B  6.0       10
# 5     A 10.5       13
# 6     B  7.0       11
# > heisenbeg$trial
# [1] A A B B A B
# Levels: A B
# > names(heisenbeg)
# [1] "trial"    "mass"     "velocity"
# > summary(heisenbeg)
#  trial      mass          velocity    
#  A:3   Min.   : 5.00   Min.   : 8.00  
#  B:3   1st Qu.: 6.25   1st Qu.:10.25  
#        Median : 8.50   Median :11.50  
#        Mean   : 8.25   Mean   :11.33  
#        3rd Qu.:10.38   3rd Qu.:12.75  
#        Max.   :11.00   Max.   :14.00  

x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)
## > x
##      [,1] [,2]
## [1,]    1    3
## [2,]    2    4
## > y
##      [,1] [,2]
## [1,]   10   10
## [2,]   10   10

# Mulitplication on matrixes
# > x * y
#      [,1] [,2]
# [1,]   10   30
# [2,]   20   40

# Matrix Mulitplication with %*%
# > x %*% y
#      [,1] [,2]
# [1,]   40   40
# [2,]   60   60

x <- c(1,3, 5) ; y <- c(3, 2, 10)
 
## > x
## [1] 1 3 5
## > y
## [1]  3  2 10
## > cbind(x, y)

##      x  y
## [1,] 1  3
## [2,] 3  2
## [3,] 5 10

# Removing matching elements 
x <- c(8, 4, 1, 10, 12, 10)
## > x
## [1]  8  4  1 10 12 10
x[x %in% 1:10] <- 0
## > x
## [1]  0  0  0  0 12  0

x <- file("data.csv")
d <- read.csv(x)

# First 4 rows of a data frame
# > d[1:4,] 

# Last 4 rows of a data frame
# > tail(d, 4)

# Find all second columns
## > t <- d[,2]
## > nas <- is.na(t)
## > nas
##   [1] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
##  [13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [25]  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
##  [37]  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE
##  [49] FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
##  [61]  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
##  [73] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE
##  [85] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [97] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE
## [109] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE
## [121] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [133] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [145] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
## > length(t[!nas])

# make filter where all cells filled
good <- complete.cases(d)
# filter all good
d[good,]

# make filter for all columns two equal to 40
fortys <- d[good,][,1] == 40

# filtering out rows on mult criteria
d[which(d$Col1 == 80 & d$Col2 < 0),]

# concat strings and merge 
paste0("test", 44)
# > [1] "test44"

# Pad string
library(stringr);
str_pad("tt", 6, pad = "0");
# > [1] "0000tt"

# call a function with a list of args
do.call(what, args, quote = FALSE, envir = parent.frame())

# merge a list of data frames together (same column)
flattenedframes <- do.call(rbind, frames)

# count complete cases
sum(complete.cases(read.csv(file)));

# files in dir
filenames <- list.files(directory, pattern="*.*", full.names=TRUE)

# cast a list to a vector
unlist()

# build up a vector iteratively
r <- vector()
for(i in 1:10){
  r <- c(r, i);
}
# > [1]  1  2  3  4  5  6  7  8  9 10

# built up a vector immutably
unlist(lapply(1:10, function(i){ i}));
# > [1]  1  2  3  4  5  6  7  8  9 10

# lapply - apply fn to each element of list (casts to list)

# mapply - apply a fn to each combination of elements
noise <- function(n, mean, sd) {
 rnorm(n, mean, sd)
}
noise(1:5, 1:5, 2)
# > [1] 4.0662119 0.4171973 1.1779003 3.8094648 5.7379961
# Noise only called once

# for each row (1,1,2), (2,2,2), (3,3,2)
mapply(noise, 1:5, 1:5, 2)

# tapply - over subsets
x <- c(rnorm(10), runif(10), rnorm(10, 1));
f <- gl(3, 10)
tapply(x, f, mean)
# >          1           2           3 
# > -0.02404061  0.33533057  1.30939699 


# split a vector into smaller vectors
x <- c(rnorm(10), runif(10), rnorm(10, 1));
f <- gl(3, 10);
split(x, f)
# returns 
# > $`1`
# >  [1] -3.0126578  0.3224711  2.0529302 -0.7029477 -0.8640036  2.1435211
# >  [7]  0.4194318 -0.1063759 -1.3741493  0.3013996
# > 
# > $`2`
# >  [1] 0.22261982 0.49628526 0.09854014 0.63240318 0.14016307 0.27188064
# >  [7] 0.85112590 0.24971773 0.39618010 0.87275596
# > 
# > $`3`
# >  [1]  1.9831870 -0.7730331  2.7567017 -0.1189265  1.4090016  0.2330963
# >  [7]  0.6046267  2.6450705  2.4615725  3.4568594

# mean each group in a vector 
lapply(split(x, f), mean)

# grouping all rows in a dataframe by column value
# then find the means of each column
s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
 # or simplify and remove NA
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")],
na.rm = TRUE))

# put in a debug stop point on a function name
debug(lm) 

# a data structure with a cached set of values
makeVector <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}
# access "fields"
c$getmean()
# NULL
c$setmean(1);
c$getmean()
# [1] 1

# a memo function to calc the mean if not already set
cachemean <- function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}

# Finding mean of a column
mean(a[which(a$Col1 == "test"), c("Col2")])

# finding the mean of a grouping
sapply(split(mtcars$mpg, mtcars$cyl), mean)

# coerce a column in a read in data-set
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
outcome[, 11] <- as.numeric(outcome[, 11])

# Making a plot of the two langs
setwd("/home/jack/programming/datasciencecoursera")
jpeg('rplot.jpg')

old <- c(31, 100, 56, 0);
new <- c(46, 100, 55, 0);
plot(old, type="o", col="blue", axes=FALSE, ann=FALSE);
lines(new, type="o", pch=22, lty=2, col="red");
axis(1, at=1:4, lab=c("C#","F#","Clojure","Javascript"))
axis(2, las=1, at=c(0,25,50,75,100))
box()
title(xlab="Language", col.lab=rgb(0,0,0))
title(ylab="Score Magnitude", col.lab=rgb(0,0, 0))
## legend(1, g_range[2], c("old model","new model"), cex=0.8, 
##    col=c("blue","red"), pch=21:22, lty=1:2);
legend(1, 100, c("old model","new model"), cex=0.8, 
   col=c("blue","red"), pch=21:22, lty=1:2);

dev.off()
