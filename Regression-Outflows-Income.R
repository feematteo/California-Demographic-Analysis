# Linear Regression 
library(olsrr)
library(ggplot2)
library(readxl)

# importing data from the Excel california-county-income-inflows-outflows
CAL_income_outflow <- read_excel("data/California_county_income-outflows-inflows.xlsx")

# Changing the data.frame names 
names(CAL_income_outflow) <- c("County", "Income", "Outflows", "Inflows")

# X1 indipendent variable: income  
# Y dependent variable: Outflows

# linear regression 
regression_1 <- lm(Outflows ~ Income, data = CAL_income_outflow)

# summary
summary(regression_1)

# Plot of the data and the linear-regression 
ggplot(CAL_income_outflow, aes(Income, Outflows)) + 
  geom_point(aes(color = "red")) + geom_smooth(method = "lm") +
  labs(title = "Regression-Income-Outflows",x = "Income", y = "Outflows")

# Residual analysis
ols_test_normality(regression_1)
ols_plot_resid_qq(regression_1)
ols_eigen_cindex(regression_1)
ols_plot_resid_fit(regression_1)
ols_plot_resid_stand(regression_1)
ols_plot_resid_lev(regression_1)
ols_plot_cooksd_bar(regression_1)
ols_plot_cooksd_chart(regression_1)
