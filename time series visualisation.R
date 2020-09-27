## USING NOTTEM DATA SET   
# A time series object containing average air temperatures at 
# Nottingham Castle in degrees Fahrenheit for 20 years.

ts_data <- nottem

# STANDARD PLOT
plot(ts_data)

# PLOT OF COMPONENTS
plot(decompose(ts_data))

# FORECAST PLOTTING
library(forecast)
plot(forecast(auto.arima(ts_data),h=5))   # h=5 means for the next 5 years


## ADVANCED PLOTS
library(ggplot2)

autoplot(ts_data)

ggseasonplot(ts_data) 

ggmonthplot(ts_data)


## AIRPASSENGERS DATA

temp<- AirPassengers

# line plot
seasonplot(temp,
             year.labels = TRUE,  #adding year labels
             col = c("red","blue"),
             type = "l")

#step plot
seasonplot(temp,
           year.labels = TRUE,  
           col = c("red","blue"),
           type = "s")
