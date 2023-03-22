#2019

#PM10
data2019 <- read.csv2('2019_PM10_1g.csv', sep = ';')
colnames(data2019) <- data2019[1,]
data2019 <- data2019[-1, ] 

date <- as.Date(data2019$`Kod stacji`[5:8764], format='%d/%m/%Y %H:%M')

library(lubridate)
library("stringr")

#date <- data2019$Nr[6:370]

year <- c()
month <- c()
day <- c()
hour <- c()
wday <- c()


for (i in 1:length(date)) {
  year[i] <- substr(date[i], 1, 4)
  month[i] <- substr(date[i], 6, 7)
  day[i] <- substr(date[i], 9, 10)
  hour[i] <- str_sub(data2019$`Kod stacji`[i+4], -5, -1)
  wday[i] <- wday(date[i], week_start = 1)
}

year <- rep(year, 6)
month <- rep(month, 6)
day <- rep(day, 6)
hour <- rep(hour, 6)
wday <- rep(wday, 6)

loc <- c(rep('Warszawa', 8760), rep('Wrocław', 8760), rep('Gdańsk', 8760), rep('Kraków', 8760), rep('Łódź', 8760), rep('Nowa Ruda', 8760))

type <- rep('PM10', 52560)

value <- c(as.numeric(data2019$MzWarAlNiepo[5:8764]), as.numeric(data2019$DsWrocWybCon[5:8764]), as.numeric(data2019$PmGdaLeczk08[5:8764]), as.numeric(data2019$MpKrakAlKras[5:8764]), as.numeric(data2019$LdLodzCzerni[5:8764]), as.numeric(data2019$DsNowRudJezi[5:8764]))

#2018

#PM10
data2018 <- read.csv('2018_PM10_1g.csv', sep = ';')
colnames(data2018) <- data2018[1,]
colnames(data2018)[1] <- "Kod stacji"
data2018 <- data2018[-1, ] 

date2018 <- as.Date(data2018$`Kod stacji`[5:8764], format='%d/%m/%Y %H:%M')

year2 <- c()
month2 <- c()
day2 <- c()
hour2 <- c()
wday2 <- c()


for (i in 1:length(date2018)) {
  year2[i] <- substr(date2018[i], 1, 4)
  month2[i] <- substr(date2018[i], 6, 7)
  day2[i] <- substr(date2018[i], 9, 10)
  hour2[i] <- str_sub(data2018$`Kod stacji`[i+4], -5, -1)
  wday2[i] <- wday(date2018[i], week_start = 1)
}

year2 <- rep(year2, 6)
month2 <- rep(month2, 6)
day2 <- rep(day2, 6)
hour2 <- rep(hour2, 6)
wday2 <- rep(wday2, 6)

loc2 <- c(rep('Warszawa', 8760), rep('Wrocław', 8760), rep('Gdańsk', 8760), rep('Kraków', 8760), rep('Łódź', 8760), rep('Nowa Ruda', 8760))

year <-c(year, year2)
month <- c(month, month2)
day <- c(day, day2)
loc <- c(loc, loc2)
hour <- c(hour, hour2)
wday <- c(wday, wday2)

type <- c(type, rep('PM10', 52560))

value2 <- c(as.numeric(data2018$MzWarAlNiepo[5:8764]), as.numeric(data2018$DsWrocWybCon[5:8764]), as.numeric(data2018$PmGdaLeczk08[5:8764]), as.numeric(data2018$MpKrakAlKras[5:8764]), as.numeric(data2018$LdLodzCzerni[5:8764]), as.numeric(data2018$DsNowRudSreb[5:8764]))

value <- c(value, value2)

data <- data.frame(year = year, month = month, day = day, hour = hour, week_day = wday, loc = loc, type = type, value = value)



#2017

#PM10
data2017 <- read.csv('2017_PM10_1g.csv', sep = ';')
colnames(data2017) <- data2017[1,]
data2017 <- data2017[-1, ] 

date2017 <- as.Date(data2017$`Kod stacji`[5:8764], format='%d/%m/%Y %H:%M')

year2 <- c()
month2 <- c()
day2 <- c()
hour2 <- c()
wday2 <- c()


for (i in 1:length(date2017)) {
  year2[i] <- substr(date2017[i], 1, 4)
  month2[i] <- substr(date2017[i], 6, 7)
  day2[i] <- substr(date2017[i], 9, 10)
  hour2[i] <- str_sub(data2017$`Kod stacji`[i+4], -5, -1)
  wday2[i] <- wday(date2017[i], week_start = 1)
}

year2 <- rep(year2, 6)
month2 <- rep(month2, 6)
day2 <- rep(day2, 6)
hour2 <- rep(hour2, 6)
wday2 <- rep(wday2, 6)

loc2 <- c(rep('Warszawa', 8760), rep('Wrocław', 8760), rep('Gdańsk', 8760), rep('Kraków', 8760), rep('Łódź', 8760), rep('Nowa Ruda', 8760))

year <-c(year, year2)
month <- c(month, month2)
day <- c(day, day2)
loc <- c(loc, loc2)
hour <- c(hour, hour2)
wday <- c(wday, wday2)

type <- c(type, rep('PM10', 52560))

value2 <- c(as.numeric(data2017$MzWarAlNiepo[5:8764]), as.numeric(data2017$DsWrocWybCon[5:8764]), as.numeric(data2017$PmGdaLeczk08[5:8764]), as.numeric(data2017$MpKrakAlKras[5:8764]), as.numeric(data2017$LdLodzCzerni[5:8764]), as.numeric(data2017$DsNowRudSreb[5:8764]))

value <- c(value, value2)

data <- data.frame(year = year, month = month, day = day, hour = hour, week_day = wday, loc = loc, type = type, value = value)

write.csv(data, 'data2.csv')