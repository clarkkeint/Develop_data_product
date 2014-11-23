---
title       : Predict children's height from parents' height
subtitle    : A simple linear regression model 
author      : Clark Keint
job         : Student
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]     # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---

## Galton's Data

1. The Data set from tabulated data set used by Galton in 1885 to study the relationship between a parent's height and their childrens.
2. This data is used to predict childrens' height by their parents' height.
3. The data frame has 928 observations on the following 2 variables:
   * child  : The child's height
   * parent : The “midparent” height
4. There is a Correction for gender via multiplying female heights by 1.08.


--- .class #3 

## Histogram of two variable

```r
library(UsingR); data(galton)
par(mfrow=c(1,2))
hist(galton$child,col="blue",breaks=100)
hist(galton$parent,col="blue",breaks=100)
```

![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1-1.png) 

--- .class #4 

## Comparing children's heights and their parents' heights
![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png) 
* Size of point in figure 2 represents number of points at that (X, Y) combination.
* Red point are mean value of two variable.

---  .class #5 
## Use the simple linear regression to fit a line 

```r
fit <- lm(child ~ parent,data=galton);
fit$coefficients
```

```
## (Intercept)      parent 
##  23.9415302   0.6462906
```
![plot of chunk unnamed-chunk-4](assets/fig/unnamed-chunk-4-1.png) 

---  .class #6
## Predict children's height from parents' height

```r
parent_height <- 66
prediction <- predict(fit, newdata = data.frame(parent=c(parent_height)))
prediction[[1]]
```

```
## [1] 66.59671
```

![plot of chunk unnamed-chunk-6](assets/fig/unnamed-chunk-6-1.png) 
