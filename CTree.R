set.seed(0007)
index <- createDataPartition(ModelDataFactored$CKD, p = 0.85, list = FALSE)
training <- ModelDataFactored[index,]
testing <- ModelDataFactored[-index,]

cTree <- ctree(CKD~., data = training)
cTree
plot(cTree, main = "Conditional Inference Tree")
#/Plots/CTree.pdf

predVector <- predict(cTree, newdata = testing)
table <- table(predVector, testing$CKD)
confusionMatrix(table, positive = "No")

print("CTree results:")
print("Accuracy: 93.7%")
print("Sensitivity: 100%")
print("Specificity: 0%")

TestDataCT <- TestDataFactored
TestDataCT$CKD <- predict(cTree, newdata = TestDataCT)
write.csv(TestDataCT, file = "CTree.csv", row.names = F, quote = F)

TestDataCT <- NULL
