library(caret)
library(caTools)
library(ROCR)
library(class)
library(MASS)
library(e1071)
library(rpart)
library(rattle)

ModelData <- read.csv("CKD Screening Data for Model Building.csv")
TestData <- read.csv("CKD Screening Data for Testing.csv")

ModelData$ID <- NULL
TestData$ID <- NULL

ModelData$X <- NULL
TestData$X <- NULL

#Keep separate copy of datasets, start factorizing variables in new copies
ModelDataFactored <- ModelData
TestDataFactored <- TestData

source("Model-Factorize.R")
source("Test-Factorize.R")

ModelDataFactored <- na.omit(ModelDataFactored)
TestDataFactored <- na.omit(TestDataFactored)

#STEP 1: Logistic regression
source("LogRes.R")


#STEP 2: KNN
source("KNN.R")

#STEP 3: LDA
source("LDA.R")

#STEP 4: Decision Tree
source("DR.R")
