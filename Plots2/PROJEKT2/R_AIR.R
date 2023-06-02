library(dplyr)  
  
airdata <- read.csv2('data.csv', header=FALSE, sep=",", fileEncoding = "UTF-8")
air_data <- airdata[,-1]
names(air_data) <- c("Year", "Month", "Day", "Loc", "Type", "Value")
air_data <- air_data[-c(1),]

categories <- unique(air_data$Loc) 

wars <- air_data[air_data$Loc == 'Warszawa' & air_data$Type == "PM2,5" & air_data$Year=="2019",]
wro <- air_data[air_data$Loc == 'Wrocław' & air_data$Type == "PM2,5" & air_data$Year=="2019", ]
gda <- air_data[air_data$Loc == 'Gdańsk' & air_data$Type == "PM2,5" & air_data$Year=="2019",]
krk <- air_data[air_data$Loc == 'Kraków' & air_data$Type == "PM2,5" & air_data$Year=="2019",]
kat <- air_data[air_data$Loc == 'Katowice' & air_data$Type == "PM2,5" & air_data$Year=="2019",]
ldz <- air_data[air_data$Loc == 'Łódź' & air_data$Type == "PM2,5" & air_data$Year=="2019",]
now_rud <- air_data[air_data$Loc == 'Nowa Ruda' & air_data$Type == "PM2,5" & air_data$Year=="2019",]


sum(is.na(wro$Value))
sum(is.na(wars$Value))
sum(is.na(krk$Value))
sum(is.na(gda$Value))
sum(is.na(now_rud$Value))
sum(is.na(ldz$Value))


wro <- wro %>% 
  mutate(X = if_else(Value > 25, 1, 0))

wro[is.na(wro)] <- 0
sum(wro$X)


wars <- wars %>% 
  mutate(X = if_else(Value > 25, 1, 0))

wars[is.na(wars)] <- 0
sum(wars$X)


krk <- krk %>% 
  mutate(X = if_else(Value > 25, 1, 0))

krk[is.na(krk)] <- 0
sum(krk$X)


gda <- gda %>% 
  mutate(X = if_else(Value > 25, 1, 0))

gda[is.na(gda)] <- 0
sum(gda$X)


now_rud <- now_rud %>% 
  mutate(X = if_else(Value > 25, 1, 0))

now_rud[is.na(now_rud)] <- 0
sum(now_rud$X)


ldz <- ldz %>% 
  mutate(X = if_else(Value > 25, 1, 0))

ldz[is.na(ldz)] <- 0
sum(ldz$X)


#Wykresy
wars <- air_data[air_data$Loc == 'Warszawa' & air_data$Type == "PM10" & air_data$Year=="2015",]
wro <- air_data[air_data$Loc == 'Wrocław' & air_data$Type == "PM10" & air_data$Year=="2015", ]
gda <- air_data[air_data$Loc == 'Gdańsk' & air_data$Type == "PM10" & air_data$Year=="2015",]
krk <- air_data[air_data$Loc == 'Kraków' & air_data$Type == "PM10" & air_data$Year=="2015",]
kat <- air_data[air_data$Loc == 'Katowice' & air_data$Type == "PM10" & air_data$Year=="2015",]
ldz <- air_data[air_data$Loc == 'Łódź' & air_data$Type == "PM10" & air_data$Year=="2015",]
now_rud <- air_data[air_data$Loc == 'Nowa Ruda' & air_data$Type == "PM10" & air_data$Year=="2019",]


library(emojifont)


x <- 1:365

png(file="2015wars.png", width = 700, height = 300)
plot(x, wars$Value, ylim=c(0,200), type='l', col="#260C51", xlab="Dzień", ylab="Stężenie [µg/m³]", main="Stężenie średniodobowe pyłu PM10 w Warszawie w 2015r.")
abline(h=50, col="#007FB6")
dev.off()

png(file="2015wro.png", width = 700, height = 300)
plot(x, wro$Value, ylim=c(0,250), type='l', col="#530F6D", xlab="Dzień", ylab="Stężenie [µg/m³]", main="Stężenie średniodobowe pyłu PM10 we Wrocławiu w 2015r.")
abline(h=50, col="#007FB6")
dev.off()


png(file="2015gda.png", width = 700, height = 300)
plot(x, gda$Value, ylim=c(0,150), type='l', col="#6F196E", xlab="Dzień", ylab="Stężenie [µg/m³]", main="Stężenie średniodobowe pyłu PM10 w Gdańsku w 2015r.")
abline(h=50, col="#007FB6")
dev.off()


png(file="2015krk.png", width = 700, height = 300)
plot(x, krk$Value, ylim=c(0,300), type='l', col="#B43359", xlab="Dzień", ylab="Stężenie [µg/m³]", main="Stężenie średniodobowe pyłu PM10 w Krakowie w 2015r.")
abline(h=50, col="#007FB6")
dev.off()


png(file="2015kat.png", width = 700, height = 300)
plot(x, kat$Value, ylim=c(0,400), type='l', col="#E25834", xlab="Dzień", ylab="Stężenie [µg/m³]", main="Stężenie średniodobowe pyłu PM10 w Katowicach w 2015r.")
abline(h=50, col="#007FB6")
dev.off()


png(file="2015ldz.png", width = 700, height = 300)
plot(x, ldz$Value, ylim=c(0,250), type='l', col="#FCA108", xlab="Dzień", ylab="Stężenie [µg/m³]", main="Stężenie średniodobowe pyłu PM10 w Łodzi w 2015r.")
abline(h=50, col="#007FB6")
dev.off()


png(file="2019now_rud.png", width = 700, height = 300)
plot(x, now_rud$Value, ylim=c(0,320), type='l', col="#F5191C", xlab="Dzień", ylab="Stężenie [µg/m³]", main="Stężenie średniodobowe pyłu PM10 w Nowej Rudzie w 2019r.")
abline(h=50, col="#007FB6")
dev.off()


plot(x, wars$Value, ylim=c(0,200), type='l', col="#260C51", xlab="Dzień", ylab="Stężenie [µg/m³]", main="Stężenie średniodobowe pyłu PM10 w Warszawie w 2019r.")
plot(x, wro$Value, ylim=c(0,200), type='l', col="#530F6D", xlab="Dzień", ylab="Stężenie [µg/m³]", main="Stężenie średniodobowe pyłu PM10 we Wrocławiu w 2019r.")
plot(x, gda$Value, ylim=c(0,200), type='l', col="#6F196E", xlab="Dzień", ylab="Stężenie [µg/m³]", main="Stężenie średniodobowe pyłu PM10 w Gdańsku w 2019r.")
plot(x, krk$Value, ylim=c(0,200), type='l', col="#B43359", xlab="Dzień", ylab="Stężenie [µg/m³]", main="Stężenie średniodobowe pyłu PM10 w Krakowie w 2019r.")
plot(x, kat$Value, ylim=c(0,200), type='l', col="#E25834", xlab="Dzień", ylab="Stężenie [µg/m³]", main="Stężenie średniodobowe pyłu PM10 w Katowicach w 2019r.")
plot(x, ldz$Value, ylim=c(0,200), type='l', col="#FCA108", xlab="Dzień", ylab="Stężenie [µg/m³]", main="Stężenie średniodobowe pyłu PM10 w Łodzi w 2019r.")
plot(x, now_rud$Value, ylim=c(0,320), type='l', col="#F5191C", xlab="Dzień", ylab="Stężenie [µg/m³]", main="Stężenie średniodobowe pyłu PM10 w Nowej Rudzie w 2019r.")

#Ograniczenie dotyczące smogu równe 50
abline(h=50, col="blue")




#####################

wars <- air_data[air_data$Loc == 'Warszawa' & air_data$Type == "PM2,5" & air_data$Year=="2015",]
wro <- air_data[air_data$Loc == 'Wrocław' & air_data$Type == "PM2,5" & air_data$Year=="2015", ]
gda <- air_data[air_data$Loc == 'Gdańsk' & air_data$Type == "PM2,5" & air_data$Year=="2015",]
krk <- air_data[air_data$Loc == 'Kraków' & air_data$Type == "PM2,5" & air_data$Year=="2015",]
kat <- air_data[air_data$Loc == 'Katowice' & air_data$Type == "PM2,5" & air_data$Year=="2015",]
ldz <- air_data[air_data$Loc == 'Łódź' & air_data$Type == "PM2,5" & air_data$Year=="2015",]
now_rud <- air_data[air_data$Loc == 'Nowa Ruda' & air_data$Type == "PM2,5" & air_data$Year=="2015",]


sum(is.na(wro$Value))
sum(is.na(wars$Value))
sum(is.na(krk$Value))
sum(is.na(gda$Value))
sum(is.na(now_rud$Value))
sum(is.na(ldz$Value))


wro[is.na(wro)] <- 0
wars[is.na(wars)] <- 0
krk[is.na(krk)] <- 0
gda[is.na(gda)] <- 0
now_rud[is.na(now_rud)] <- 0
ldz[is.na(ldz)] <- 0


sum(wro$Value > 25)
sum(wars$Value > 25)
sum(krk$Value > 25)
sum(gda$Value > 25)
sum(now_rud$Value > 25)
sum(ldz$Value > 25)

  