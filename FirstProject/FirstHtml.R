## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----cars----------------------------------------------------------------
summary(cars)

## ----pressure, echo=FALSE------------------------------------------------
plot(pressure)

## ---- echo = TRUE--------------------------------------------------------
library(ggplot2)
waterTemp <- runif(50)
planktonAbun <- runif(50)
qplot(x=waterTemp, y=planktonAbun)
# print(waterTemp)
# head(waterTemp)

## ---- eval=TRUE, message= FALSE------------------------------------------
qplot(x=waterTemp)

