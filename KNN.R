ModelData <- na.omit(ModelData)
ModelDataScaled <- ModelData


ModelDataScaled <- ModelDataFactored

ModelDataScaled <- sapply(ModelDataScaled, as.numeric)
ModelDataScaled <- as.data.frame(scale(ModelDataScaled))


index <- createDataPartition(ModelDataFactored$CKD, p = 0.75, list = FALSE)
training <- ModelDataScaled[index,]
testing <- ModelDataScaled[-index,]

KNN <- knn(training, testing, cl = training$CKD, k = 3)


#Now let's try finding the best k
ctrl <- trainControl(method = "repeatedcv", number = 3, repeats = 3)
knnFit <- train(CKD~., data = training, method = "knn", trControl = ctrl, tuneLength = 20)
knnFit
print("Final value of k = 27")

training$CKD <- factor(training$CKD, labels = c("Yes", "No"), levels=c(1,0))

KNN_Final <- knn(training, testing, cl = training$CKD, k = 27)
table(testing$CKD, KNN_Final)
confusionMatrix(KNN_Final, testing$CKD)

print("K-Nearest Neighbors results:")
print("Accuracy: 98%")
print("Sensitivity: 100% (overfitting?)")
print("Specificity: 77%")


training <- NULL
testing <- NULL