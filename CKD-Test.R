library(caret)
library(caTools)
library(ROCR)
library(class)
library(MASS)
library(e1071)
library(rpart)
library(rpart.plot)
library(rattle)
library(randomForest)
library(party)

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

#STEP 4: Random Forest
source("RandomForest.R")

#STEP 5: Decision Tree
source("DecistionTree.R")

#STEP 6: CTree
source("CTree.R")
