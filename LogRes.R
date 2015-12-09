#Even though we have a separate test dataset, we have to divite Model data into training and testing sets.
set.seed(0305)
index <- createDataPartition(ModelDataFactored$CKD, p = 0.75, list = FALSE)
training <- ModelDataFactored[index,]
testing <- ModelDataFactored[-index,]

LogRes <- glm(CKD~., data = training, family="binomial")
summary(LogRes)

predVector <- predict(LogRes, newdata = testing, type = "response") #Seems like we have rank deficiency

table <- table(Predicted = predVector > 0.5, Actual = (testing$CKD == "Yes"))
confusionMatrix(table)

pred <- prediction(predVector, testing$CKD)
perf <- performance(pred, "tpr", "fpr")
plot(perf)

areaUnderCurve <- performance(pred, "auc")@y.values

print("Logistic regression results:")
print("Accuracy: 93%")
print("Sensitivity: 98.6%")
print("Specificity: 13.6%")
print("Area Under Curve: 89%")
#Out-of-the-box logistic regression gives an area under the curve of 0.8912601. Not bad, needs more work

TestDataLR <- TestDataFactored
TestDataLR$CKD <- predict(LogRes, newdata = TestDataLR, type="response")
write.csv(TestDataLR, file = "LogisticRegression.csv", row.names = F, quote = F)

#We'll need to reuse names, delete old datasets
training <- NULL
testing <- NULL

TestDataLR <- NULL

