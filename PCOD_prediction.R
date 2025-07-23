library(ggplot2)
library(dplyr)
library(caret)
library(randomForest)
library(corrplot)

# Load data
data <- pcod.csv_clean

# Add PCOD risk label
data$PCOD_Risk <- ifelse(data$BMI > 25, "High", "Low")
data$PCOD_Risk <- factor(data$PCOD_Risk)

# Histogram - Age
hist(data$Age, col = "lightblue", main = "Age Distribution", xlab = "Age")

# Boxplot - BMI vs Unusual Bleeding
ggplot(data, aes(x = Unusual_Bleeding, y = BMI, fill = Unusual_Bleeding)) +
  geom_boxplot() +
  theme_minimal()

# Bar chart - Risk levels
ggplot(data, aes(x = PCOD_Risk, fill = PCOD_Risk)) +
  geom_bar() +
  theme_minimal()

#Corelation matrix
pcod_numeric <- pcod.csv_clean[, sapply(pcod.csv_clean, is.numeric)]
pcod_numeric <- pcod_numeric[, colSums(is.na(pcod_numeric)) == 0]
pcod_numeric <- pcod_numeric[, apply(pcod_numeric, 2, sd) != 0]
cor_matrix <- cor(pcod_numeric)
corrplot(cor_matrix, method = "color", type = "upper", 
         tl.col = "black", tl.cex = 0.8, number.cex = 0.7)

# Select features
model_data <- data[, c("BMI", "Age", "Length_of_cycle", "Menses_score", "Unusual_Bleeding", "PCOD_Risk")]

# Train-test split
set.seed(123)
index <- createDataPartition(model_data$PCOD_Risk, p = 0.8, list = FALSE)
train <- model_data[index, ]
test <- model_data[-index, ]

# Random Forest model
model <- randomForest(PCOD_Risk ~ ., data = train, ntree = 100, importance = TRUE)

# Prediction
pred <- predict(model, test)

# Confusion Matrix
confusionMatrix(pred, test$PCOD_Risk)

# Feature Importance
imp <- as.data.frame(importance(model))
imp$Feature <- rownames(imp)

ggplot(imp, aes(x = reorder(Feature, MeanDecreaseGini), y = MeanDecreaseGini)) +
  geom_col(fill = "Red") +
  coord_flip() +
  theme_minimal()
