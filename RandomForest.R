set.seed(0305)
index <- createDataPartition(ModelDataFactored$CKD, p = 0.75, list = FALSE)
training <- ModelDataFactored[index,]
testing <- ModelDataFactored[-index,]

rf.tuning <- tuneRF(training[,-33], training$CKD, stepFactor=1.5)
rf <- randomForest(CKD~., data = training, ntree = 1000, mtry = 5)
#Tuning doesn't yield any productive results. Error = 0.05%
#Tuning plot included (/Plots/RF_tune.png)

#Plotting variable importance (/Plots/RF_varImp.png)
varImpPlot(rf, main = "Variable importance")


predVector <- predict(rf, newdata = testing)
predVector
table <- table(predVector, testing$CKD)
confusionMatrix(table, positive = "No")

#100 - 0 also possible, since results fluctuate on every creation of a forest (by 0.5% approximately)
print("Random Forest results:")
print("Accuracy: 93%")
print("Sensitivity: 99.8%")
print("Specificity: 0%")


TestDataRF <- TestDataFactored
TestDataRF$CKD <- predict(rf, newdata = TestDataRF, type="class")
write.csv(TestDataRF, file = "RandomForest.csv", row.names = F, quote = F)

TestDataRF <- NULL
