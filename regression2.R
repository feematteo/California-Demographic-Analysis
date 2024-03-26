# Multi-Linear Regression 

# Importing the libraries 
library(olsrr)
library(ggplot2)
library(readxl)

# Importing data from the excel file 
data_regression2 <- read_excel("data/CAL_regrrrrr.xlsx")

# Y = Outflows Number
# linear regression 
regression2 <- lm(formula = Outflows_Number ~  Renter_median_housing_costs +
                    Owner_median_housing_costs +
                    Income + 
                    Tota_Sales_Tax, data = data_regression2)

# Information from the linear regression 
summary(regression2)


###
# Correlation Analysis

# Preparing the data for the correlation 
# Removing the first two text column
corr_data <-data_regression2[-c(1, 2)]
cor_data <- cor(corr_data)

# Plot Correlation Matrix  
install.packages("corrplot")
library(corrplot)
corrplot(cor_data, method = "circle")
