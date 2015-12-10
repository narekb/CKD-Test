set.seed(0007)
index <- createDataPartition(ModelDataFactored$CKD, p = 0.75, list = FALSE)
training <- ModelDataFactored[index,]
testing <- ModelDataFactored[-index,]

RFS <- rfsrc(CKD~., data = training, ntree = 1000)
plot(RFS)
#/Plots/RFS.pdf

predVector <- predict.rfsrc(RFS, newdata = testing, type = "class")
predVector$predicted

#This technique was used merely for the plot
