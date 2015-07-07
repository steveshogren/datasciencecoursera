normalize <- function(x) {
    return ((x - min(x)) / (max(x) - min(x)))
  }

chartit <-  function(df){
  plot(df$old, type="o", col="blue", axes=FALSE, ann=FALSE);
  lines(df$new, type="o", pch=22, lty=2, col="red");
  axis(1, at=1:5, lab=c("C#","F#","Clojure","Javascript", "Coffeescript"))
  box()
  title(xlab="Language", col.lab=rgb(0,0,0))
  title(ylab="Score Magnitude", col.lab=rgb(0,0, 0))
  legend("topright", NULL, c("overfitted model","simpler model"), cex=0.8,
         col=c("blue","red"), pch=21:22, lty=1:2);
}

oldscores <- c(-70, 192, 24, -187, -115);
newscores <- c(2, 8, 3, -3, -2);

df <- data.frame( "old" = oldscores, "new" = newscores, stringsAsFactors = FALSE)
dfNorm <- as.data.frame(lapply(df, normalize))

setwd("/home/jack/programming/datasciencecoursera")
jpeg('rplot.jpg')
chartit(dfNorm)
dev.off()
