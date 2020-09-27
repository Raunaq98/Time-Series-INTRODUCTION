# IT store in a large city with most employees being part time and hence no employee
# has total overvieww of the entire week

# Friday and Saturday shifts are more hectic and hence employees complain about too many
# customer enquiries on these days wwhich they cannot fully handle
# due to this, YELP ratings have started to fall down due to lack of staff

# RESOURCE ALLOCATION PROBLEM

## Analyze customer counts and provide insights for better employee allocation

## ____________________________________________________________________________________##

########### imported data as "store"
# each day has 2 inputs : morning shift and evening shift
# mon to sat opening
# starting date is monday of 25th week of 2017

store <- store$V2
# we dont need the time stamp

# 2 shifts x 6 days = 12 inputs a week

## CONVERTING TO TIME SERIES
store_series <- ts(store,
                   start = 1,
                   frequency = 12) # 12 obs a week

## VISAULISING THE TIME SERIES
plot(store_series,
     ylab = "Customer Count",
     xlab = "Weeks")
# not only do fri and sat have more customers,
# but also customers are more in the eve than morning everyday
## no increase in customers = no need for hiring

# MONTHPLOT = average for each time unit
library(forecast)

monthplot(store_series,
          labels = 1:12,
          xlab = "BiDaily units")
# this shows average of entire data divided by morning and evening of each day

# SEASONPLOT = check seasonality ( weeks in this case )

seasonplot(store_series,
           season.labels = FALSE,
           xlab = "weekly timeline")


## no trend but clear seasonal pattern
# seasonal = cannot use simple models = ARIMA

plot(forecast(auto.arima(store_series)))

