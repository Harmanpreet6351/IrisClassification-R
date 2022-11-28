## ----setup, include=FALSE-----------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ----include = FALSE----------------------------------------------------
library(datasets)
library(GGally)
library(ggplot2)
library(e1071)
library(caret)


## -----------------------------------------------------------------------
head(iris)


## -----------------------------------------------------------------------
summary(iris)


## -----------------------------------------------------------------------
ggpairs(iris[-5], mapping = aes(colour=iris$Species), progress = F)


## -----------------------------------------------------------------------
samp <- sample(nrow(iris), 0.75*nrow(iris))
train <- iris[samp,]
test <- iris[-samp,]


## -----------------------------------------------------------------------
head(train)


## -----------------------------------------------------------------------
head(test)


## -----------------------------------------------------------------------
model1 <- svm(Species ~ ., data = train)
pred1 <- predict(model1, test[-5])
confusionMatrix(pred1, test$Species)


## -----------------------------------------------------------------------
model2 <- svm(Species ~ Petal.Length + Petal.Width, data = train)
pred2 <- predict(model2, test[c(3,4)])
confusionMatrix(pred2, test$Species)

