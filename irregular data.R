## IMPORTED IRREGULAR DATA AS "SENSOR"
# some dates have more than 1 entry
# we can club these into 1 obs to get 1 obs/day

# SEPARATE DATES AND TIME
library(tidyr)
irreg_sensor <- separate(data = sensor,
                         col = V1,
                         into = c("date","time"),
                         sep = 8,   # 8 chars from left
                         remove = TRUE) # removes the column in question

# CONVERTING CHAR TO DATE
dates <- strptime(irreg_sensor$date, 
                  "%m/%d/%y")

# CREATING CLEAN DF
clean_sensor <- data.frame(dates = as.Date(dates),
                           measure = irreg_sensor$V2)

# CREATING A ZOO OBJECT
library(zoo)
zoo_sensor <- zoo( clean_sensor$measure,
                   order.by = clean_sensor$dates) 

# AGGREGATING
sensor_reg <- aggregate( zoo_sensor,
                         as.Date,
                         mean)

# the zoo object can be plotted as it is
plot(sensor_reg)

# CREATING TIME SERIES
sensor_series<- ts(sensor_reg)
plot(sensor_series)
