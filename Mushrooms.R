library(datasets)
library(FFTrees)
library(randomForest)
library(ggplot2)
library(dplyr)

mushrooms <- data.frame(mushrooms)

ggplot(data = mushrooms, aes(poisonous, fill = poisonous)) + geom_bar()

## Create testing set and training set ##

rows <- sample(nrow(mushrooms), nrow(mushrooms) * 0.7, replace = FALSE)
train <- mushrooms[rows,]
test <- mushrooms[-rows,]

model <- FFTrees(poisonous ~ ., data = train)
model
plot(model, what = 'cues')

pred <- predict(model, test)
table(pred, test$poisonous)
