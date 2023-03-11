data <- read.csv("2021_PM10_1g.csv", sep = ',')
data_all <- as.numeric(data$X13[6:8765])

ts.plot(data_all)

data_week_jan <- data_all[1:168]
ts.plot(data_week_jan)

date_all <- data$Nr[6:8765]
date_week_jan <- date_all[1:168]
#date_week_jan <- as.Date(date_week_jan, "%m/%d/%Y %H:%M")
date_week_jan <- strptime(date_week_jan, ,format='%m/%d/%Y %H:%M')

#plot(date_week_jan, data_week_jan, cex = 0.9,type = "l" ,xaxt = "n")

plot(date_week_jan,data_week_jan,xaxt='n')
axis.POSIXct(1,date_week_jan, format='%d-%m-%Y %H:%M', mgp=c(3,2,0))

plot(date_week_jan,data_week_jan)

plot(zeit,val,xaxt='n')
axis.POSIXct(1,zeit, format='%Y-%m-%d %H:%M')