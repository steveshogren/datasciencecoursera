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

