ModelData <- na.omit(ModelData)
ModelDataScaled <- ModelData


#nums <- sapply(ModelDataFactored, is.numeric)
#ModelDataScaled <- as.data.frame(scale(ModelData[, nums]))

ModelDataScaled <- sapply(ModelDataFactored, as.numeric)
ModelDataScaled <- as.data.frame(scale(ModelDataScaled))


index <- createDataPartition(ModelDataFactored$CKD, p = 0.75, list = FALSE)
training <- ModelDataScaled[index,]
testing <- ModelDataScaled[-index,]

KNN <- knn(training, testing, cl = training$CKD, k = 3)


#Now let's try finding the best k
ctrl <- trainControl(method = "repeatedcv", number = 3, repeats = 3)
knnFit <- train(CKD~., data = training, method = "knn", trControl = ctrl, tuneLength = 20)
knnFit
print("Final value of k = 41")

KNN_Final <- knn(training, testing, cl = training$CKD, k = 19)
table(testing$CKD, KNN_Final)
confusionMatrix(KNN_Final, testing$CKD)

print("K-Nearest Neighbors results:")
print("Accuracy: 98%")
print("Sensitivity: 100% (overfitting?)")
print("Specificity: 83%")


training <- NULL
testing <- NULL