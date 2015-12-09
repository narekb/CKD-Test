TestDataFactored$Female <- factor(TestDataFactored$Female, levels = c(0, 1), labels = c("No", "Yes"))
TestDataFactored$Educ <- factor(TestDataFactored$Educ, levels = c(0, 1), labels = c("HighSchool", "Above"))
TestDataFactored$Unmarried <- factor(TestDataFactored$Unmarried, levels = c(0, 1), labels = c("No", "Yes"))
TestDataFactored$Income <- factor(TestDataFactored$Income, levels = c(0, 1), labels = c("BelowMedian", "AboveMedian"))
TestDataFactored$Insured <- factor(TestDataFactored$Insured, levels = c(0, 1), labels = c("No", "Yes"))

TestDataFactored$Obese <- factor(TestDataFactored$Obese, levels = c(0, 1), labels = c("No", "Yes"))
TestDataFactored$Dyslipidemia <- factor(TestDataFactored$Dyslipidemia, levels = c(0, 1), labels = c("No", "Yes"))

TestDataFactored$PVD <- factor(TestDataFactored$PVD, levels = c(0, 1), labels = c("No", "Yes"))

TestDataFactored$Diabetes <- factor(TestDataFactored$Diabetes, levels = c(0, 1), labels = c("No", "Yes"))
TestDataFactored$Fam.Diabetes <- factor(TestDataFactored$Fam.Diabetes, levels = c(0, 1), labels = c("No", "Yes"))

TestDataFactored$Activity <- factor(TestDataFactored$Activity, levels = c(1, 2, 3, 4), labels = c("Sit", "Walk", "Light", "Heavy"))
TestDataFactored$PoorVision <- factor(TestDataFactored$PoorVision, levels = c(0, 1), labels = c("No", "Yes"))
TestDataFactored$Smoker <- factor(TestDataFactored$Smoker, levels = c(0, 1), labels = c("No", "Yes"))
TestDataFactored$Hypertension <- factor(TestDataFactored$Hypertension, levels = c(0, 1), labels = c("No", "Yes"))
TestDataFactored$Fam.Hypertension <- factor(TestDataFactored$Fam.Hypertension, levels = c(0, 1), labels = c("No", "Yes"))

TestDataFactored$Stroke <- factor(TestDataFactored$Stroke, levels = c(0, 1), labels = c("No", "Yes"))
TestDataFactored$CVD <- factor(TestDataFactored$CVD, levels = c(0, 1), labels = c("No", "Yes"))
TestDataFactored$Fam.CVD <- factor(TestDataFactored$Fam.CVD, levels = c(0, 1), labels = c("No", "Yes"))
TestDataFactored$CHF <- factor(TestDataFactored$CHF, levels = c(0, 1), labels = c("No", "Yes"))
TestDataFactored$Anemia <- factor(TestDataFactored$Anemia, levels = c(0, 1), labels = c("No", "Yes"))