#install.packages("pacman")

# To import the data files
pacman::p_load(rio)

# To handle data frame
pacman::p_load(dplyr)

# To plot
pacman::p_load(ggplot2)

train <- import("data/train.csv")
test <- import("data/test.csv")

# EDA (Exploratory Data Analysis) for data in train
str(train)
any(is.na(train))

# Check the relationship between Survived and Sex
any(is.na(train$Survived))
any(is.na(train$Sex))
table(train$Sex, train$Survived)

train %>% ggplot(aes(Survived, fill=Sex)) +
  geom_bar(position = "dodge")

# Check the relationship between Survived and Age
any(is.na(train$Survived))
any(is.na(train$Age))

train %>% filter(!is.na(Age)) %>% 
  ggplot(aes(Age, fill = as.factor(Survived))) +
  geom_density(alpha = 0.2)

train %>% filter(!is.na(Age)) %>% 
  ggplot(aes(Age, ..count.., fill = as.factor(Survived))) +
  geom_density(alpha = 0.2)

# Check the relationship between Survived and Pclass
any(is.na(train$pclass))
train %>% ggplot(aes(Survived, fill = as.factor(Pclass))) +
  geom_bar(position = "dodge")

# Clean up
rm(list = ls())
detach("package:rio", unload = TRUE)
pacman::p_unload(all)
dev.off()
cat("\014")



