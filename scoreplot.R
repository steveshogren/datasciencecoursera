normalize <- function(x) {
    return (x - min(x) / (max(x) - min(x))
  }

chartit <-  function(df){
  plot(df$old, type="o", col="blue", axes=FALSE, ann=FALSE);
  lines(df$new, type="o", pch=22, lty=2, col="red");
  lines(df$bugs, type="o", pch=22, lty=2, col="green");
  axis(1, at=1:5, lab=c("C#","F#","Clojure","Javascript", "Coffeescript")
  box()
  title(xlab="Language", col.lab=rgb(0,0,0)
  title(ylab="Score Magnitude", col.lab=rgb(0,0, 0)
  legend("topright", NULL, c("overfitted model","simpler model","av. bug/repo"), cex=0.8,
         col=c("blue","red", "green"), pch=21:22, lty=1:2);
}

## trimmed mean

## oldscores <- c(-70, 192, 24, -187, -115);
## newscores <- c(2, 8, 3, -3, -2);
## bugsperproj <- c(-107.43333,  -16.80000,  -10.48333, -101.25000,  -58.46667)
## bugsperproj <- c(-10.906667, -0.85714287, -1.3981482, -14.886666, -5.48)
## bugsperproj <- c(-32, -20, -3, -44, -23)
## bugsperproj <- c(-24, -3, -2, -44, -23)
## bugsperproj <- c(-15, -4, -3, -29, -7)
## oldscores <-   c(0,0,0,0,0, 0,0,0,0,0,0,0);
newscores <- c(2, 8, 3, -3, -2,  0,0,0,0,0,0,0);
oldscores <- c(-15,-4,-3,-29,-7,-7,-22,-13,-23,-5,-6,-12)
bugsperproj <- c(63,45,33,123,35,30,65,48,60,23,17,44)

        

df <- data.frame( "old" = oldscores, "new" = newscores, "bugs"=bugsperproj, stringsAsFactors = FALSE)
dfNorm <- as.data.frame(lapply(df, normalize)


## setwd("/home/jack/programming/datasciencecoursera")
## jpeg('rplot.jpg')
chartit(dfNorm)
## dev.off()



bugs <- c(6446, 588, 629, 6075, 3508)
## repos <- c(300845, 4113,  29861, 1445782, 49051)
## with more than 5 stars
repos <- c(60, 35, 60, 60, 60)

p <- function(x, y) {
    (x/y);
}

df <- data.frame( "bugs" = bugs, "repos" = repos, stringsAsFactors = FALSE)
p(df$bugs, df$repos)

x <- mtcars[1:3]
y <- mtcars[4:6]
cor(x, y)


## -0.03048367 of a scale of -1..1 where 0 is no correlation
## so across all languages there is a very weak correlation
testsperproj <- c(22,11,19,24,8,97,47,86,151,14,56,97)
bugsperproj <- c(63,45,33,123,35,30,65,48,60,23,17,44)
cor(bugsperproj, testsperproj);

## [1] 0.2026391
csharpbugs <- c(6,7,8,9,10,11,12,12,12,13,13,13,13,13,15,16,16,17,17,17,18,19,19,19,20,20,21,22,24,25,26)
fsharpbugs <- c(3,3,3,6,6,6)
clojurebugs <- c(1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,4,4,4,4,5,6,7,7)
jsbugs <- c(10,12,12,14,14,15,17,19,21,22,23,24,24,24,24,24,25,25,27,27,29,29,30,33,37,39,39,39,41,44,49,50,51,61,63)
coffeescriptbugs <- c(3,4,4,4,4,4,4,5,5,5,5,5,6,6,6,7,7,7,9,9,10,10,12,13,15,16,18)
scalabugs <- c(2,3,3,3,3,4,4,4,4,5,5,5,6,6,6,7,7,7,7,8,9,9,9,10,11,13,13,15,18,21)
phpbugs <- c(7,8,8,9,10,10,11,12,12,14,14,16,17,18,20,21,21,22,28,31,36,42,45,46,48,48)
gobugs <- c(4,4,4,5,5,5,5,6,6,6,6,7,8,8,9,10,12,13,13,13,14,15,16,20,20,20,25,26,27,27,29,31,33)
javabugs <- c(4,4,4,4,5,5,5,5,6,6,7,7,7,10,11,14,17,17,19,28,33,37,40,54,54,61,68,69,75)
haskellbugs <- c(1,1,1,2,2,3,3,3,3,4,4,4,5,5,5,8,8,9,11,11,11,11)
rubybugs <- c(2,2,2,2,2,3,3,3,3,3,3,4,4,4,5,5,5,6,7,7,8,8,10,11,11,11,12,14,17)
pythonbugs <- c(3,4,4,4,4,4,4,4,5,5,5,5,6,7,9,11,12,12,13,14,16,16,19,20,20,21,23,26,32,33)
csharptests <- c(0,1,9,0,9,4,15,0,3,3,2,1,12,0,1,0,3,1,7,0,1,4,31,20,4,6,0,2,29,0,1)
fsharptests <- c(4,0,2,0,0,1)
clojuretests <- c(0,1,0,0,2,1,1,0,1,6,0,1,2,1,0,0,1,27,0,0,0,0,1)
jstests <- c(12,0,1,0,1,0,0,0,0,0,9,41,0,0,0,0,19,0,0,54,0,1,1,0,32,0,0,6,0,26,0,0,0,3,0)
coffeescripttests <- c(1,2,0,1,3,3,2,6,9,0,0,0,7,1,5,0,1,0,0,0,0,1,0,0,4,0,0)
scalatests <- c(18,10,21,23,40,2,11,1,0,41,2,49,11,73,15,75,38,34,0,76,23,48,0,3,19,14,3,3,0,77)
phptests <- c(14,3,11,0,2,11,4,0,40,25,12,37,0,1,0,24,16,20,3,106,24,0,56,0,4,1)
gotests <- c(0,7,4,35,14,3,5,3,3,2,12,14,43,0,1,15,9,0,3,8,267,43,1,9,37,123,7,66,30,15,0,28,4)
javatests <- c(0,1,1,1,0,2,0,0,0,0,0,164,1,56,46,0,0,0,0,0,657,3,14,50,0,421,24,219,47)
haskelltests <- c(2,0,0,0,0,2,1,2,17,1,2,3,2,2,0,1,30,0,0,0,3,1)
rubytests <- c(23,4,54,4,2,17,8,2,20,0,39,23,9,10,0,25,17,12,52,22,37,7,0,9,49,31,30,0,63)
pythontests <- c(13,24,0,0,72,1,7,0,4,0,164,0,2,11,0,0,38,0,0,68,0,33,311,2,9,0,3,1,10,28)

cor(csharpbugs, csharptests)
## [1] 0.2026391
cor(fsharpbugs, fsharptests)
## [1] -0.5698029
cor(clojurebugs, clojuretests)
## [1] 0.06092004
cor(jsbugs, jstests)
## [1] -0.004879538
cor(coffeescriptbugs, coffeescripttests)
## [1] -0.2601686
cor(scalabugs, scalatests)
## [1] 0.0892568
cor(phpbugs, phptests)
## [1] 0.1386184
cor(gobugs, gotests)
## [1] 0.1428496
cor(javabugs, javatests)
## [1] 0.3499227
cor(haskellbugs, haskelltests)
## [1] 0.08387504
cor(rubybugs, rubytests)
## [1] 0.3297201
cor(pythonbugs, pythontests)
## [1] 0.07100754


newscores <- c(2, 8, 3, -3, -2) 
bugsPerCommit <- c(63,45,33,123,35)
cor(newscores, bugsPerCommit)
