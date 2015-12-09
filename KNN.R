ModelData <- na.omit(ModelData)


ModelDataScaled <- ModelDataFactored
TestDataScaled <- TestDataFactored

ModelDataScaled <- sapply(ModelDataScaled[,-33], as.numeric)
ModelDataScaled <- as.data.frame(scale(ModelDataScaled[,-33]))
ModelDataScaled$CKD <- ModelDataFactored$CKD

TestDataScaled <- sapply(TestDataScaled, as.numeric)
TestDataScaled <- as.data.frame(scale(TestDataScaled))

set.seed(0305)
index <- createDataPartition(ModelDataFactored$CKD, p = 0.75, list = FALSE)
training <- ModelDataScaled[index,]
testing <- ModelDataScaled[-index,]


#Now let's try finding the best k
ctrl <- trainControl(method = "repeatedcv", number = 3, repeats = 3)
knnFit <- train(CKD~., data = training, method = "knn", trControl = ctrl, tuneLength = 20)
knnFit
print("Final value of k = 19")

#training$CKD <- factor(training$CKD, labels = c("Yes", "No"), levels=c(1,0))
#testing$CKD <- factor(testing$CKD, labels = c("Yes", "No"), levels=c(1,0))

KNN_Final <- knn(training[,-33], testing[,-33], cl = training$CKD, k = 17)
table(testing$CKD, KNN_Final)
confusionMatrix(KNN_Final, testing$CKD)

print("K-Nearest Neighbors results:")
print("Accuracy: 93%")
print("Sensitivity: 100%")
print("Specificity: 0%")

KNN_Pred <- knn(ModelDataScaled[, -33], TestDataScaled, cl = ModelDataScaled$CKD, k = 17)
TestDataKNN <- TestDataFactored
TestDataKNN$CKD <- KNN_Pred
write.csv(TestDataKNN, file = "KNN.csv", row.names = F, quote = F)

ModelDataScaled <- NULL
TestDataScaled <- NULL
training <- NULL
testing <- NULL
