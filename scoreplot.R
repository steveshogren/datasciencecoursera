normalize <- function(x) {
    return ((x - min(x)) / (max(x) - min(x)))
  }

chartit <-  function(df){
  plot(df$old, type="o", col="blue", axes=FALSE, ann=FALSE);
  lines(df$new, type="o", pch=22, lty=2, col="red");
  lines(df$bugs, type="o", pch=22, lty=2, col="green");
  axis(1, at=1:5, lab=c("C#","F#","Clojure","Javascript", "Coffeescript"))
  box()
  title(xlab="Language", col.lab=rgb(0,0,0))
  title(ylab="Score Magnitude", col.lab=rgb(0,0, 0))
  legend("topright", NULL, c("overfitted model","simpler model","av. bug/repo"), cex=0.8,
         col=c("blue","red", "green"), pch=21:22, lty=1:2);
}

## trimmed mean

oldscores <- c(-70, 192, 24, -187, -115);
newscores <- c(2, 8, 3, -3, -2);
## bugsperproj <- c(-107.43333,  -16.80000,  -10.48333, -101.25000,  -58.46667)
## bugsperproj <- c(-10.906667, -0.85714287, -1.3981482, -14.886666, -5.48)
## bugsperproj <- c(-32, -20, -3, -44, -23)
bugsperproj <- c(-24, -3, -2, -44, -23)

df <- data.frame( "old" = oldscores, "new" = newscores, "bugs"=bugsperproj, stringsAsFactors = FALSE)
dfNorm <- as.data.frame(lapply(df, normalize))

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
