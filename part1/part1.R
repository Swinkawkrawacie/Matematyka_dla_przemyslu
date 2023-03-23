#2019

#PM10
data2019 <- read.csv('2019_PM10_24g.csv', sep = ',')

#date <- strptime(data2019$Nr[6:369], format='%m/%d/%Y %H:%M')
date <- as.Date(data2019$Nr[6:370], format='%m/%d/%Y %H:%M')

library(lubridate)

#date <- data2019$Nr[6:369]

year <- c()
month <- c()
day <- c()


for (i in 1:length(date)) {
  year[i] <- substr(date[i], 1, 4)
  month[i] <- substr(date[i], 6, 7)
  day[i] <- substr(date[i], 9, 10)
}

year <- rep(year, 7)
month <- rep(month, 7)
day <- rep(day, 7)

loc <- c(rep('Warszawa', 365), rep('Wrocław', 365), rep('Gdańsk', 365), rep('Kraków', 365), rep('Katowice', 365), rep('Łódź', 365), rep('Nowa Ruda', 365))

year <- rep(year, 2)
month <- rep(month, 2)
day <- rep(day, 2)
loc <- rep(loc, 2)

type <- c(rep('PM10', 2555), rep('PM2,5', 2555))

value <- c(as.numeric(data2019$X97[6:370]), as.numeric(data2019$X13[6:370]), as.numeric(data2019$X123[6:370]), as.numeric(data2019$X66[6:370]), as.numeric(data2019$X143[6:370]), as.numeric(data2019$X42[6:370]), as.numeric(data2019$X5[6:370]))

data <- data.frame(year = year, month = month, day = day, loc = loc, type = type, value = value)

#PM2,5

data2019_25 <- read.csv('2019_PM25_24g.csv', sep = ',')

value <- c(value, as.numeric(data2019_25$X29[6:370]), as.numeric(data2019_25$X4[6:370]), as.numeric(data2019_25$X39[6:370]), as.numeric(data2019_25$X22[6:370]), as.numeric(data2019_25$X50[6:370]), as.numeric(data2019_25$X15[6:370]), rep(NA, 365))



#2018

#PM10
data2018 <- read.csv('2018_PM10_24g.csv', sep = ';')

#date <- strptime(data2019$Nr[6:369], format='%m/%d/%Y %H:%M')
date2018 <- as.Date(data2018$X[6:370], format='%m/%d/%Y %H:%M')

library(lubridate)

year2 <- c()
month2 <- c()
day2 <- c()


for (i in 1:length(date2018)) {
  year2[i] <- substr(date2018[i], 1, 4)
  month2[i] <- substr(date2018[i], 6, 7)
  day2[i] <- substr(date2018[i], 9, 10)
}

year2 <- rep(year2, 7)
month2 <- rep(month2, 7)
day2 <- rep(day2, 7)

loc2 <- c(rep('Warszawa', 365), rep('Wrocław', 365), rep('Gdańsk', 365), rep('Kraków', 365), rep('Katowice', 365), rep('Łódź', 365), rep('Nowa Ruda', 365))

year2 <- rep(year2, 2)
year <-c(year, year2)
month2 <- rep(month2, 2)
month <- c(month, month2)
day2 <- rep(day2, 2)
day <- c(day, day2)
loc2 <- rep(loc2, 2)
loc <- c(loc, loc2)

type <- c(type, rep('PM10', 2555), rep('PM2,5', 2555))

value <- c(value, as.numeric(data2018$X89[6:370]), as.numeric(data2018$X12[6:370]), as.numeric(data2018$X111[6:370]), as.numeric(data2018$X66[6:370]), as.numeric(data2018$X133[6:370]), as.numeric(data2018$X39[6:370]), as.numeric(data2018$X4[6:370]))

#PM2,5

data2018_25 <- read.csv('2018_PM25_24g.csv', sep = ';')

value<- c(value, as.numeric(data2018_25$X29[6:370]), as.numeric(data2018_25$X4[6:370]), as.numeric(data2018_25$X39[6:370]), as.numeric(data2018_25$X22[6:370]), as.numeric(data2018_25$X52[6:370]), as.numeric(data2018_25$X15[6:370]), rep(NA, 365))

data <- data.frame(year = year, month = month, day = day, loc = loc, type = type, value = value)



#2017

#PM10
data2017 <- read.csv('2017_PM10_24g.csv', sep = ';')

#date <- strptime(data2019$Nr[6:369], format='%m/%d/%Y %H:%M')
date2017 <- as.Date(data2017$Nr[6:370], format='%m/%d/%Y %H:%M')

library(lubridate)

year2 <- c()
month2 <- c()
day2 <- c()


for (i in 1:length(date2017)) {
  year2[i] <- substr(date2017[i], 1, 4)
  month2[i] <- substr(date2017[i], 6, 7)
  day2[i] <- substr(date2017[i], 9, 10)
}

year2 <- rep(year2, 7)
month2 <- rep(month2, 7)
day2 <- rep(day2, 7)

loc2 <- c(rep('Warszawa', 365), rep('Wrocław', 365), rep('Gdańsk', 365), rep('Kraków', 365), rep('Katowice', 365), rep('Łódź', 365), rep('Nowa Ruda', 365))

year2 <- rep(year2, 2)
year <-c(year, year2)
month2 <- rep(month2, 2)
month <- c(month, month2)
day2 <- rep(day2, 2)
day <- c(day, day2)
loc2 <- rep(loc2, 2)
loc <- c(loc, loc2)

type <- c(type, rep('PM10', 2555), rep('PM2,5', 2555))

value <- c(value, as.numeric(data2017$X88[6:370]), as.numeric(data2017$X12[6:370]), as.numeric(data2017$X110[6:370]), as.numeric(data2017$X65[6:370]), as.numeric(data2017$X131[6:370]), as.numeric(data2017$X38[6:370]), as.numeric(data2017$X4[6:370]))

#PM2,5

data2017_25 <- read.csv('2017_PM25_24g.csv', sep = ';')

value<- c(value, as.numeric(data2017_25$X31[6:370]), as.numeric(data2017_25$X4[6:370]), as.numeric(data2017_25$X39[6:370]), as.numeric(data2017_25$X22[6:370]), as.numeric(data2017_25$X50[6:370]), as.numeric(data2017_25$X15[6:370]), rep(NA, 365))

data <- data.frame(year = year, month = month, day = day, loc = loc, type = type, value = value)



#2016

#PM10
data2016 <- read.csv('2016_PM10_24g.csv', sep = ';')

#date <- strptime(data2019$Nr[6:369], format='%m/%d/%Y %H:%M')
date2016 <- as.Date(data2016$X[6:371], format='%m/%d/%Y %H:%M')

year2 <- c()
month2 <- c()
day2 <- c()


for (i in 1:length(date2016)) {
  year2[i] <- substr(date2016[i], 1, 4)
  month2[i] <- substr(date2016[i], 6, 7)
  day2[i] <- substr(date2016[i], 9, 10)
}

year2 <- rep(year2, 7)
month2 <- rep(month2, 7)
day2 <- rep(day2, 7)

loc2 <- c(rep('Warszawa', 366), rep('Wrocław', 366), rep('Gdańsk', 366), rep('Kraków', 366), rep('Katowice', 366), rep('Łódź', 366), rep('Nowa Ruda', 366))

year2 <- rep(year2, 2)
year <-c(year, year2)
month2 <- rep(month2, 2)
month <- c(month, month2)
day2 <- rep(day2, 2)
day <- c(day, day2)
loc2 <- rep(loc2, 2)
loc <- c(loc, loc2)

type <- c(type, rep('PM10', 2562), rep('PM2,5', 2562))

value<- c(value, as.numeric(data2016$X86[6:371]), as.numeric(data2016$X13[6:371]), as.numeric(data2016$X107[6:371]), as.numeric(data2016$X61[6:371]), as.numeric(data2016$X127[6:371]), as.numeric(data2016$X37[6:371]), as.numeric(data2016$X5[6:371]))

#PM2,5

data2016_25 <- read.csv('2016_PM25_24g.csv', sep = ';')

value<- c(value, as.numeric(data2016_25$X30[6:371]), as.numeric(data2016_25$X4[6:371]), as.numeric(data2016_25$X39[6:371]), as.numeric(data2016_25$X22[6:371]), as.numeric(data2016_25$X51[6:371]), as.numeric(data2016_25$X16[6:371]), rep(NA, 366))



#2015

#PM10
data2015 <- read.csv('2015_PM10_24g.csv', sep = ',')

#date <- strptime(data2019$Nr[6:369], format='%m/%d/%Y %H:%M')
date2015 <- as.Date(data2015$Kod.stacji[3:367], format='%m/%d/%Y')

year2 <- c()
month2 <- c()
day2 <- c()


for (i in 1:length(date2015)) {
  year2[i] <- substr(date2015[i], 1, 4)
  month2[i] <- substr(date2015[i], 6, 7)
  day2[i] <- substr(date2015[i], 9, 10)
}

year2 <- rep(year2, 7)
month2 <- rep(month2, 7)
day2 <- rep(day2, 7)

loc2 <- c(rep('Warszawa', 365), rep('Wrocław', 365), rep('Gdańsk', 365), rep('Kraków', 365), rep('Katowice', 365), rep('Łódź', 365), rep('Nowa Ruda', 365))

year2 <- rep(year2, 2)
year <-c(year, year2)
month2 <- rep(month2, 2)
month <- c(month, month2)
day2 <- rep(day2, 2)
day <- c(day, day2)
loc2 <- rep(loc2, 2)
loc <- c(loc, loc2)

type <- c(type, rep('PM10', 2555), rep('PM2,5', 2555))

value<- c(value, as.numeric(data2015$MzWarAKrzywo[3:367]), as.numeric(data2015$DsWrocOrzech[3:367]), as.numeric(data2015$PmGdaLecz08m[3:367]), as.numeric(data2015$MpKrakBujaka[3:367]), as.numeric(data2015$SlKatoPlebA4[3:367]), as.numeric(data2015$LdLodzLegion[3:367]), as.numeric(data2015$DsNowRudSreb[3:367]))

#PM2,5

data2015_25 <- read.csv('2015_PM25_24g.csv', sep = ',')

value<- c(value, as.numeric(data2015_25$MzWarWokalna[3:367]), as.numeric(data2015_25$DsWrocNaGrob[3:367]), as.numeric(data2015_25$PmGdaPowWiel[3:367]), as.numeric(data2015_25$MpKrakBujaka[3:367]), as.numeric(data2015_25$SlKatoPlebA4[3:367]), as.numeric(data2015_25$LdLodzLegion[3:367]), rep(NA, 365))


#2020

#PM10
data2020 <- read.csv('2020_PM10_24g.csv', sep = ';')
colnames(data2020) <- data2020[1,]
data2020 <- data2020[-1, ] 
#date <- strptime(data2019$Nr[6:369], format='%m/%d/%Y %H:%M')
date2020 <- as.Date(data2020$`Kod stacji`[5:370], format='%d/%m/%Y')

year2 <- c()
month2 <- c()
day2 <- c()


for (i in 1:length(date2020)) {
  year2[i] <- substr(date2020[i], 1, 4)
  month2[i] <- substr(date2020[i], 6, 7)
  day2[i] <- substr(date2020[i], 9, 10)
}

year2 <- rep(year2, 7)
month2 <- rep(month2, 7)
day2 <- rep(day2, 7)

loc2 <- c(rep('Warszawa', 366), rep('Wrocław', 366), rep('Gdańsk', 366), rep('Kraków', 366), rep('Katowice', 366), rep('Łódź', 366), rep('Nowa Ruda', 366))

year2 <- rep(year2, 2)
year <-c(year, year2)
month2 <- rep(month2, 2)
month <- c(month, month2)
day2 <- rep(day2, 2)
day <- c(day, day2)
loc2 <- rep(loc2, 2)
loc <- c(loc, loc2)

type <- c(type, rep('PM10', 2562), rep('PM2,5', 2562))

value<- c(value, as.numeric(data2020$MzWarAKrzywo[5:370]), as.numeric(data2020$DsWrocOrzech[5:370]), as.numeric(data2020$PmGdaLecz08m[5:370]), as.numeric(data2020$MpKrakBujaka[5:370]), as.numeric(data2020$SlKatoPlebA4[5:370]), as.numeric(data2020$LdLodzLegion[5:370]), as.numeric(data2020$DsNowRudJezi[5:370]))

#PM2,5

data2020_25 <- read.csv('2020_PM25_24g.csv', sep = ';')
colnames(data2020_25) <- data2020_25[1,]
data2020_25 <- data2020_25[-1, ] 

value<- c(value, as.numeric(data2020_25$MzWarKondrat[5:370]), as.numeric(data2020_25$DsWrocNaGrob[5:370]), as.numeric(data2020_25$PmGdaPowWiel[5:370]), as.numeric(data2020_25$MpKrakOsPias[5:370]), as.numeric(data2020_25$SlKatoPlebA4[5:370]), as.numeric(data2020_25$LdLodzLegion[5:370]), rep(NA, 366))

data <- data.frame(year = year, month = month, day = day, loc = loc, type = type, value = value)


#2021

#PM10
data2021 <- read.csv('2021_PM10_24g.csv', sep = ';')
colnames(data2021) <- data2021[1,]
data2021 <- data2021[-1, ] 
date2021 <- as.Date(data2021$`Kod stacji`[5:369], format='%d/%m/%Y')

year2 <- c()
month2 <- c()
day2 <- c()


for (i in 1:length(date2021)) {
  year2[i] <- substr(date2021[i], 1, 4)
  month2[i] <- substr(date2021[i], 6, 7)
  day2[i] <- substr(date2021[i], 9, 10)
}

year2 <- rep(year2, 7)
month2 <- rep(month2, 7)
day2 <- rep(day2, 7)

loc2 <- c(rep('Warszawa', 365), rep('Wrocław', 365), rep('Gdańsk', 365), rep('Kraków', 365), rep('Katowice', 365), rep('Łódź', 365), rep('Nowa Ruda', 365))

year2 <- rep(year2, 2)
year <-c(year, year2)
month2 <- rep(month2, 2)
month <- c(month, month2)
day2 <- rep(day2, 2)
day <- c(day, day2)
loc2 <- rep(loc2, 2)
loc <- c(loc, loc2)

type <- c(type, rep('PM10', 2555), rep('PM2,5', 2555))

value<- c(value, as.numeric(data2021$MzWarAKrzywo[5:369]), as.numeric(data2021$DsWrocOrzech[5:369]), as.numeric(data2021$PmGdaLeczk81[5:369]), as.numeric(data2021$MpKrakBujaka[5:369]), as.numeric(data2021$SlKatoKossut[5:369]), as.numeric(data2021$LdLodzLegion[5:369]), as.numeric(data2021$DsNowRudJezi[5:369]))

#PM2,5

data2021_25 <- read.csv('2021_PM25_24g.csv', sep = ';')
colnames(data2021_25) <- data2021_25[1,]
data2021_25 <- data2021_25[-1, ] 

value<- c(value, as.numeric(data2021_25$MzWarWokalna[5:369]), as.numeric(data2021_25$DsWrocNaGrob[5:369]), as.numeric(data2021_25$PmGdaPowWiel[5:369]), as.numeric(data2021_25$MpKrakOsPias[5:369]), as.numeric(data2021_25$SlKatoKossut[5:369]), as.numeric(data2021_25$LdLodzLegion[5:369]), rep(NA, 365))

data <- data.frame(year = year, month = month, day = day, loc = loc, type = type, value = value)

write.csv(data, 'data.csv')

data_test <- read.csv('data.csv')

