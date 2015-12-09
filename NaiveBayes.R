set.seed(0305)
index <- createDataPartition(ModelDataFactored$CKD, p = 0.75, list = FALSE)
training <- ModelDataFactored[index,]
testing <- ModelDataFactored[-index,]

nb <- naiveBayes(CKD~., data=training,laplace=1)

predVector<-predict(nb, newdata=testing)
confusionMatrix(predVector, testing$CKD, positive="No")

print("Naive Bayes results:")
print("Accuracy: 86%")
print("Sensitivity: 87%")
print("Specificity: 62%")

TestDataNB <- TestDataFactored
TestDataNB$CKD <- predict(nb, newdata=TestDataNB)

write.csv(TestDataNB, file = "NaiveBayes.csv", row.names = F, quote = F)
TestDataNB <- NULL