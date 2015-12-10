set.seed(0305)

ModelDataNum <- as.data.frame(sapply(ModelDataFactored, as.numeric))

index <- createDataPartition(ModelDataFactored$CKD, p = 0.75, list = FALSE)
training <- ModelDataNum[index,]
testing <- ModelDataNum[-index,]

n <- names(training)
names <- paste(n[1:32], collapse = ' + ')
f <- paste("CKD ~ ", names)
nn <- neuralnet(f, training, hidden = c(5,4), threshold = 0.03, stepmax = 5e+07, learningrate = 0.05, lifesign = "full")

nn.results <- compute(nn, testing[-33])

predVector <- (nn.results$net.result < 1.5)
table <- table(Predicted = (predVector), Actual = (testing$CKD == 1))
table

print("Neural Network results:")
print("Sensitivity: 100%")
print("Specificity: 0%")

TestDataNN <- TestDataFactored
TestDataNN <- as.data.frame(sapply(TestDataNN, as.numeric))
nn.predNew <- compute(nn, TestDataNN)
TestDataNN <- round(nn.predNew$net.result)

write.csv(TestDataNN, file = "NeuralNet.csv", row.names = F, quote = F)

TestDataNN <- NULL
testing <- NULL
training <- NULL