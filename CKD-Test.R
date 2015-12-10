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
library(kernlab)
library(neuralnet)
library(randomForestSRC)

ModelData <- read.csv("CKD Screening Data for Model Building.csv")
TestData <- read.csv("CKD Screening Data for Testing.csv")

ModelData$ID <- NULL
TestData$ID <- NULL

ModelData$X <- NULL
TestData$X <- NULL

ModelData<-ModelData[-5934,] #Bad row. VERY bad row

ModelData <- na.omit(ModelData)
TestData <- na.omit(TestData)

ModelData$Racegrp <- droplevels(ModelData$Racegrp)
ModelData$CareSource <- droplevels(ModelData$CareSource)

TestData$Racegrp <- droplevels(TestData$Racegrp)
TestData$CareSource <- droplevels(TestData$CareSource)

levels(ModelData$Racegrp) <- levels(TestData$Racegrp)
levels(TestData$CareSource) <- levels(ModelData$CareSource)


#Keep separate copy of datasets, start factorizing variables in new copies
ModelDataFactored <- ModelData
TestDataFactored <- TestData

source("Model-Factorize.R")
source("Test-Factorize.R")

#STEP 0: Random Forest of Survival - Erik
source("RFS.R")

#STEP 1: Random Forest - Erik
source("RandomForest.R")

#STEP 2: Logistic regression - Narek
source("LogRes.R")

#STEP 3: KNN - Karen
source("KNN.R")

#STEP 4: LDA - Karen
source("LDA.R")

#STEP 5: Decision Tree - Erik
source("DecistionTree.R")

#STEP 6: CTree - Erik
source("CTree.R")

#STEP 7: SVM - Narek
source("SVM.R")

#STEP 8: Naive Bayes - Karen
source("NaiveBayes.R")

#STEP 9: Neural Networks - Narek
source("NeuralNet.R")