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
