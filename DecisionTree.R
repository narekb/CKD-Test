set.seed(0007)

index <- createDataPartition(ModelDataFactored$CKD, p = 0.85, list = FALSE)
training <- ModelDataFactored[index,]
testing <- ModelDataFactored[-index,]

decTree <- rpart(CKD~., data = training, method = "class", control = rpart.control(cp = 0.0000001))
prp(decTree, type = 1, extra = 4)
#/Plots/DecitionTree_unpruned.pdf

decTreePruned <- prune(decTree, cp = 0.01)
prp(decTreePruned, type = 1, extra = 4)
#/Plots/DecitionTree_pruned.pdf


#asRules(decTree) - for finding rule covers
#asRules(decTreePruned)

predVector1 <- predict(decTree, newdata = testing, type = "class")
table1 <- table(predVector1, testing$CKD)
confusionMatrix(table1, positive = "No")

print("Unpruned decistion tree results:")
print("Accuracy: 93%")
print("Sensitivity: 97.6%")
print("Specificity: 25%")

TestDataDT1 <- TestDataFactored
TestDataDT1$CKD <- predict(decTree, newdata = TestDataDT1, type = "class")
write.csv(TestDataDT1, file = "DecisionTreeUnpruned.csv", row.names = F, quote = F)

predVector2 <- predict(decTreePruned, newdata = testing, type = "class")
table2 <- table(predVector2, testing$CKD)
confusionMatrix(table2, positive = "No")

print("Pruned decistion tree results:")
print("Accuracy: 92.7%")
print("Sensitivity: 98.2%")
print("Specificity: 10%")

TestDataDT2 <- TestDataFactored
TestDataDT2$CKD <- predict(decTreePruned, newdata = TestDataDT2, type = "class")
write.csv(TestDataDT2, file = "DecisionTreePruned.csv", row.names = F, quote = F)

table1 <- NULL
table2 <- NULL
TestDataDT2 <- NULL
TestDataDT1 <- NULL


