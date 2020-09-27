## CREATING VECTOR

data <- runif( n =50,
               min = 10,
               max = 45)


## FORMING TIME SERIES
# assume that we start at year 1956 with 4 observations each year (quarterly)
series <- ts( data,
              start = 1956,       # first value of cycle
              frequency = 4)      # number of observations per cycle

## VISUALISING
plot(series)

## CHECK TIME STAMP
time(series)
#          Qtr1    Qtr2    Qtr3    Qtr4
# 1956    1956.00 1956.25 1956.50 1956.75

## we want to start in the third quarter
series2 <- ts( data,
               start = c(1956,3),       
               frequency = 4) 

time(series2)
#        Qtr1    Qtr2    Qtr3    Qtr4
# 1956                 1956.50 1956.75

## hourly measurements with daily patterns with the first one starting at 8am
daily <- ts(data,
            start= c(1,8),
            frequency = 24)


## making a time series of 450 random numbers monthly starting in november 1914
random <- runif(n=450,
                min=0,
                max=50)
random_series <- ts(random,
                    start = c(1914,11),
                    frequency = 12)
library(lattice)
xyplot.ts(random_series)
