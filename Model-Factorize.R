ModelDataFactored$Female <- factor(ModelDataFactored$Female, levels = c(0, 1), labels = c("No", "Yes"))
ModelDataFactored$Educ <- factor(ModelDataFactored$Educ, levels = c(0, 1), labels = c("HighSchool", "Above"))
ModelDataFactored$Unmarried <- factor(ModelDataFactored$Unmarried, levels = c(0, 1), labels = c("No", "Yes"))
ModelDataFactored$Income <- factor(ModelDataFactored$Income, levels = c(0, 1), labels = c("BelowMedian", "AboveMedian"))

ModelDataFactored$Insured <- factor(ModelDataFactored$Insured, levels = c(0, 1), labels = c("No", "Yes"))
ModelDataFactored$Obese <- factor(ModelDataFactored$Obese, levels = c(0, 1), labels = c("No", "Yes"))
ModelDataFactored$Dyslipidemia <- factor(ModelDataFactored$Dyslipidemia, levels = c(0, 1), labels = c("No", "Yes"))
ModelDataFactored$PVD <- factor(ModelDataFactored$PVD, levels = c(0, 1), labels = c("No", "Yes"))

ModelDataFactored$Diabetes <- factor(ModelDataFactored$Diabetes, levels = c(0, 1), labels = c("No", "Yes"))
ModelDataFactored$Fam.Diabetes <- factor(ModelDataFactored$Fam.Diabetes, levels = c(0, 1), labels = c("No", "Yes"))

ModelDataFactored$Activity <- factor(ModelDataFactored$Activity, levels = c(1, 2, 3, 4), labels = c("Sit", "Walk", "Light", "Heavy"))
ModelDataFactored$PoorVision <- factor(ModelDataFactored$PoorVision, levels = c(0, 1), labels = c("No", "Yes"))
ModelDataFactored$Smoker <- factor(ModelDataFactored$Smoker, levels = c(0, 1), labels = c("No", "Yes"))
ModelDataFactored$Hypertension <- factor(ModelDataFactored$Hypertension, levels = c(0, 1), labels = c("No", "Yes"))

ModelDataFactored$Fam.Hypertension <- factor(ModelDataFactored$Fam.Hypertension, levels = c(0, 1), labels = c("No", "Yes"))
ModelDataFactored$Stroke <- factor(ModelDataFactored$Stroke, levels = c(0, 1), labels = c("No", "Yes"))
ModelDataFactored$CVD <- factor(ModelDataFactored$CVD, levels = c(0, 1), labels = c("No", "Yes"))
ModelDataFactored$Fam.CVD <- factor(ModelDataFactored$Fam.CVD, levels = c(0, 1), labels = c("No", "Yes"))

ModelDataFactored$CHF <- factor(ModelDataFactored$CHF, levels = c(0, 1), labels = c("No", "Yes"))
ModelDataFactored$Anemia <- factor(ModelDataFactored$Anemia, levels = c(0, 1), labels = c("No", "Yes"))
ModelDataFactored$CKD <- factor(ModelDataFactored$CKD, levels = c(0, 1), labels = c("No", "Yes"))
