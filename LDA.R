index <- createDataPartition(ModelDataFactored$CKD, p = 0.75, list = FALSE)
training <- ModelDataFactored[index,]
testing <- ModelDataFactored[-index,]


#Keep separate set for easily checking colinearities

ModelDataNum <- ModelDataFactored

indx <- sapply(ModelDataFactored, is.factor)
ModelDataNum[indx] <- lapply(ModelDataNum[indx], function(x) as.numeric(x))

print(cor(ModelDataNum), digits = 2)

ModelDataNum$Total.Chol <- NULL
ModelDataNum$Weight <- NULL
ModelDataNum$Fam.Hypertension <- NULL
ModelDatanum$Female <- NULL

LDA <- lda(CKD~.-Total.Chol-Weight-Fam.Hypertension-Female, data = training, cv = "TRUE")
LDApred <- predict(LDA, newdata = testing)

confusionMatrix(LDApred$class, testing$CKD, positive = "No")

print("Linear Discriminant Analysis results:")
print("Accuracy: 91%")
print("Sensitivity: 95%")
print("Specificity: 28%")

newPred <- predict(LDA, newdata = TestDataLDA)
TestDataLDA <- TestDataFactored
TestDataLDA$CKD <- newPred$class


write.csv(TestDataLDA, file = "LDA.csv", row.names = F, quote = F)

training <- NULL
testing <- NULL
ModelDataNum <- NULL