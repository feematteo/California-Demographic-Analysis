# Multi-Linear Regression 

# Importing the libraries 
library(olsrr)
library(ggplot2)
library(readxl)

# Importing data from the excel file 
data_regression2 <- read_excel("data/CAL_multi-reg.xlsx")

###
# Correlation Analysis

# Preparing the data for the correlation 
# Removing the first two text column
corr_data <-data_regression2[-c(1, 2, 4)]
cor_data <- cor(corr_data)

# Plot Correlation Matrix  
# install.packages("corrplot")
library(corrplot)
corrplot(cor_data, method = "circle")


# Multi-Linear Regression 

# Y = Outflows Number
# linear regression 
regression2 <- lm(formula = Outflows_Number ~  Renter_median_housing_costs +
                    Income + 
                    Tota_Sales_Tax , data = data_regression2)

# Information from the linear regression 
summary(regression2)


# Residual Analysis 
ols_test_normality(regression2)
ols_plot_resid_qq(regression2)
ols_eigen_cindex(regression2)
ols_plot_resid_fit(regression2)
ols_plot_resid_stand(regression2)
ols_plot_resid_lev(regression2)
ols_plot_cooksd_bar(regression2)
ols_plot_cooksd_chart(regression2)






