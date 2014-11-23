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
2. This data is used to predict childrens' height from their parents' height.
3. There is a correction for gender via multiplying female heights by 1.08.

```r
library(UsingR); data(galton);
names(galton)
```

```
## [1] "child"  "parent"
```

```r
dim(galton)
```

```
## [1] 928   2
```


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
