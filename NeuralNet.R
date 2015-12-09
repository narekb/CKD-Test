set.seed(0305)

ModelDataNum <- as.data.frame(sapply(ModelDataFactored, as.numeric))

index <- createDataPartition(ModelDataFactored$CKD, p = 0.75, list = FALSE)
training <- ModelDataNum[index,]
testing <- ModelDataNum[-index,]

n <- names(training)
names <- paste(n[1:32], collapse = ' + ')
nn <- neuralnet(f, training, hidden = c(5,4), threshold = 0.03, stepmax = 5e+07, learningrate = 0.02, lifesign = "full")
