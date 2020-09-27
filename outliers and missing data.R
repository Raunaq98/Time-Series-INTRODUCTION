# imported data as "mydata"

my_series <- ts(mydata$mydata)
# there are certain NAs in this ts

# EDA
summary(my_series)
# 5 NAs
# clear outliers in the 4th quartile

plot(my_series)
# 4 upper outliers


# OUTLIERS
library(forecast)
my_series1<- tsoutliers(my_series)
my_series1
# gives the positions of outliers and their values through local regression

# MISSING VALUES
library(zoo)

my_series_locf<- na.locf(my_series)   # last known value gets carry forwarded into the NA

my_series_fill <- na.fill(my_series,33)  # fills 33 into all NAs

my_series_interpolation <- na.interp(my_series)  # fits a local interpolation


## FIXING NA AND MISSING VALUES THROUGH ONE FUNCTION
library(forecast)
my_series_clean <- tsclean(my_series)
plot(my_series_clean)
