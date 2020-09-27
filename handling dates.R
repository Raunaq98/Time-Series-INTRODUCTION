
# %Y: 4-digit year (1982)
# %y: 2-digit year (82)
# %m: 2-digit month (01)
# %d: 2-digit day of the month (13)
# %A: weekday (Wednesday)
# %a: abbreviated weekday (Wed)
# %B: month (January)
# %b: abbreviated month (Jan)
#
# %H : hours
# %M : minutes
# %S : seconds

### BEST IS TO CHECK THE FORMAT USING ?STRPTIME

my_date<- as.Date("1971-14-05", format = "%Y-%d-%m")
# [1] "1971-05-14"

str1 <- "May 23, '96"
str2 <- "2012-03-15"
str3 <- "30/January/2006"

# Convert the strings to dates: date1, date2, date3
date1 <- as.Date(str1, format = "%b %d, '%y")
date2<- as.Date(str2, format = "%Y-%m-%d")
date3<- as.Date(str3, format="%d/%B/%Y")



## POSIXct and POSIXlt

x = as.POSIXct("2019-12-25 11:45:34")
unclass(x)  # returns total number of seconds

y = as.POSIXlt("2019-12-25 11:45:34")
unclass(y)  # returns a list of attributes of time



## "STRPTIME" FUNCTION    = convert char to date

a = as.character(c("1993-01-02 23:45",
                   "1998-02-08 05:29",
                   "2000-09-10 19:45"))      # character

b = strptime(a, format = "%Y-%m-%d %H:%M")   # date

c = format(b, "%Y")                          # extracted years



## "LUBRIDATE" PACKAGE
library(lubridate)

temp <- c("1993-01-01",
          "1999,11,11",
          19980208,
          "2010/04/05",
          "2010-feb-20")

temp2<- ymd(temp)
# [1] "1993-01-01" "1999-11-11" "1998-02-08" "2010-04-05" "2010-02-20"

year(temp2)
# [1] 1993 1999 1998 2010 2010

month(temp2)
# [1]  1 11  2  4  2