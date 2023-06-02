df <- read.csv2('data2.csv', sep=",", fileEncoding = "UTF-8")
names(df) <- c("X","Year", "Month", "Day", "Hour", "Week_day", "Loc", "Type", "Value")

categories <- unique(df$Loc) 

df[, c(9)] <- sapply(df[, c(9)], as.numeric)
air_data <- df[!is.na(df$Value),]

air_data$Hour_numb[air_data$Hour=="01:00"] = 1
air_data$Hour_numb[air_data$Hour=="02:00"] = 2
air_data$Hour_numb[air_data$Hour=="03:00"] = 3
air_data$Hour_numb[air_data$Hour=="04:00"] = 4
air_data$Hour_numb[air_data$Hour=="05:00"] = 5
air_data$Hour_numb[air_data$Hour=="06:00"] = 6
air_data$Hour_numb[air_data$Hour=="07:00"] = 7
air_data$Hour_numb[air_data$Hour=="08:00"] = 8
air_data$Hour_numb[air_data$Hour=="09:00"] = 9
air_data$Hour_numb[air_data$Hour=="10:00"] = 10
air_data$Hour_numb[air_data$Hour=="11:00"] = 11
air_data$Hour_numb[air_data$Hour=="12:00"] = 12
air_data$Hour_numb[air_data$Hour=="13:00"] = 13
air_data$Hour_numb[air_data$Hour=="14:00"] = 14
air_data$Hour_numb[air_data$Hour=="15:00"] = 15
air_data$Hour_numb[air_data$Hour=="16:00"] = 16
air_data$Hour_numb[air_data$Hour=="17:00"] = 17
air_data$Hour_numb[air_data$Hour=="18:00"] = 18
air_data$Hour_numb[air_data$Hour=="19:00"] = 19
air_data$Hour_numb[air_data$Hour=="20:00"] = 20
air_data$Hour_numb[air_data$Hour=="21:00"] = 21
air_data$Hour_numb[air_data$Hour=="22:00"] = 22
air_data$Hour_numb[air_data$Hour=="23:00"] = 23
air_data$Hour_numb[air_data$Hour=="00:00"] = 24


workday <- air_data[air_data$Week_day == 1 | air_data$Week_day == 2 | 
                       air_data$Week_day == 3 | air_data$Week_day == 4 | air_data$Week_day == 5,]

weekend <- air_data[air_data$Week_day == 6 | air_data$Week_day == 7,]



for (i in 1:24)  {      
  x <- workday[workday$Loc == 'Warszawa' & workday$Hour_numb==i,]
  assign(paste("Warszawa_work", i, sep = "_") , x)      
}

for (i in 1:24)  {      
  x <- workday[workday$Loc == 'Wrocław' & workday$Hour_numb==i,]
  assign(paste("Wrocław_work", i, sep = "_") , x)      
}

for (i in 1:24)  {      
  x <- workday[workday$Loc == 'Gdańsk' & workday$Hour_numb==i,]
  assign(paste("Gdańsk_work", i, sep = "_") , x)      
}

for (i in 1:24)  {      
  x <- workday[workday$Loc == 'Kraków' & workday$Hour_numb==i,]
  assign(paste("Kraków_work", i, sep = "_") , x)      
}

for (i in 1:24)  {      
  x <- workday[workday$Loc == 'Łódź' & workday$Hour_numb==i,]
  assign(paste("Łódź_work", i, sep = "_") , x)      
}

for (i in 1:24)  {      
  x <- workday[workday$Loc == 'Nowa Ruda' & workday$Hour_numb==i,]
  assign(paste("Nowa_Ruda_work", i, sep = "_") , x)      
}


Time <- c("01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00",
          "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00", "24:00")
Warszawa_work <- c(mean(Warszawa_work_1$Value), mean(Warszawa_work_2$Value), mean(Warszawa_work_3$Value), mean(Warszawa_work_4$Value), 
              mean(Warszawa_work_5$Value), mean(Warszawa_work_6$Value), mean(Warszawa_work_7$Value), mean(Warszawa_work_8$Value),
              mean(Warszawa_work_9$Value), mean(Warszawa_work_10$Value), mean(Warszawa_work_11$Value), mean(Warszawa_work_12$Value), 
              mean(Warszawa_work_13$Value), mean(Warszawa_work_14$Value), mean(Warszawa_work_15$Value), mean(Warszawa_work_16$Value), 
              mean(Warszawa_work_17$Value), mean(Warszawa_work_18$Value), mean(Warszawa_work_19$Value), mean(Warszawa_work_20$Value),
              mean(Warszawa_work_21$Value), mean(Warszawa_work_22$Value), mean(Warszawa_work_23$Value), mean(Warszawa_work_24$Value)) 
Wrocław_work <- c(mean(Wrocław_work_1$Value), mean(Wrocław_work_2$Value), mean(Wrocław_work_3$Value), mean(Wrocław_work_4$Value), 
             mean(Wrocław_work_5$Value), mean(Wrocław_work_6$Value), mean(Wrocław_work_7$Value), mean(Wrocław_work_8$Value), 
             mean(Wrocław_work_9$Value), mean(Wrocław_work_10$Value), mean(Wrocław_work_11$Value), mean(Wrocław_work_12$Value),
             mean(Wrocław_work_13$Value), mean(Wrocław_work_14$Value), mean(Wrocław_work_15$Value), mean(Wrocław_work_16$Value), 
             mean(Wrocław_work_17$Value), mean(Wrocław_work_18$Value), mean(Wrocław_work_19$Value), mean(Wrocław_work_20$Value), 
             mean(Wrocław_work_21$Value), mean(Wrocław_work_22$Value), mean(Wrocław_work_23$Value), mean(Wrocław_work_24$Value))
Gdańsk_work <- c(mean(Gdańsk_work_1$Value), mean(Gdańsk_work_2$Value), mean(Gdańsk_work_3$Value), mean(Gdańsk_work_4$Value), 
            mean(Gdańsk_work_5$Value), mean(Gdańsk_work_6$Value), mean(Gdańsk_work_7$Value), mean(Gdańsk_work_8$Value),
            mean(Gdańsk_work_9$Value), mean(Gdańsk_work_10$Value), mean(Gdańsk_work_11$Value), mean(Gdańsk_work_12$Value), 
            mean(Gdańsk_work_13$Value), mean(Gdańsk_work_14$Value), mean(Gdańsk_work_15$Value), mean(Gdańsk_work_16$Value), 
            mean(Gdańsk_work_17$Value), mean(Gdańsk_work_18$Value), mean(Gdańsk_work_19$Value), mean(Gdańsk_work_20$Value),
            mean(Gdańsk_work_21$Value), mean(Gdańsk_work_22$Value), mean(Gdańsk_work_23$Value), mean(Gdańsk_work_24$Value)) 
Kraków_work <- c(mean(Kraków_work_1$Value), mean(Kraków_work_2$Value), mean(Kraków_work_3$Value), mean(Kraków_work_4$Value), 
            mean(Kraków_work_5$Value), mean(Kraków_work_6$Value), mean(Kraków_work_7$Value), mean(Kraków_work_8$Value),
            mean(Kraków_work_9$Value), mean(Kraków_work_10$Value), mean(Kraków_work_11$Value), mean(Kraków_work_12$Value), 
            mean(Kraków_work_13$Value), mean(Kraków_work_14$Value), mean(Kraków_work_15$Value), mean(Kraków_work_16$Value), 
            mean(Kraków_work_17$Value), mean(Kraków_work_18$Value), mean(Kraków_work_19$Value), mean(Kraków_work_20$Value),
            mean(Kraków_work_21$Value), mean(Kraków_work_22$Value), mean(Kraków_work_23$Value), mean(Kraków_work_24$Value)) 
Łódź_work <- c(mean(Łódź_work_1$Value), mean(Łódź_work_2$Value), mean(Łódź_work_3$Value), mean(Łódź_work_4$Value), 
          mean(Łódź_work_5$Value), mean(Łódź_work_6$Value), mean(Łódź_work_7$Value), mean(Łódź_work_8$Value),
          mean(Łódź_work_9$Value), mean(Łódź_work_10$Value), mean(Łódź_work_11$Value), mean(Łódź_work_12$Value), 
          mean(Łódź_work_13$Value), mean(Łódź_work_14$Value), mean(Łódź_work_15$Value), mean(Łódź_work_16$Value), 
          mean(Łódź_work_17$Value), mean(Łódź_work_18$Value), mean(Łódź_work_19$Value), mean(Łódź_work_20$Value),
          mean(Łódź_work_21$Value), mean(Łódź_work_22$Value), mean(Łódź_work_23$Value), mean(Łódź_work_24$Value)) 
Nowa_Ruda_work <- c(mean(Nowa_Ruda_work_1$Value), mean(Nowa_Ruda_work_2$Value), mean(Nowa_Ruda_work_3$Value), mean(Nowa_Ruda_work_4$Value), 
               mean(Nowa_Ruda_work_5$Value), mean(Nowa_Ruda_work_6$Value), mean(Nowa_Ruda_work_7$Value), mean(Nowa_Ruda_work_8$Value),
               mean(Nowa_Ruda_work_9$Value), mean(Nowa_Ruda_work_10$Value), mean(Nowa_Ruda_work_11$Value), mean(Nowa_Ruda_work_12$Value), 
               mean(Nowa_Ruda_work_13$Value), mean(Nowa_Ruda_work_14$Value), mean(Nowa_Ruda_work_15$Value), mean(Nowa_Ruda_work_16$Value), 
               mean(Nowa_Ruda_work_17$Value), mean(Nowa_Ruda_work_18$Value), mean(Nowa_Ruda_work_19$Value), mean(Nowa_Ruda_work_20$Value),
               mean(Nowa_Ruda_work_21$Value), mean(Nowa_Ruda_work_22$Value), mean(Nowa_Ruda_work_23$Value), mean(Nowa_Ruda_work_24$Value)) 

df_work <- data.frame(Time, Warszawa_work, Wrocław_work, Gdańsk_work, Kraków_work, Łódź_work, Nowa_Ruda_work)


for (i in 1:24)  {      
  x <- weekend[weekend$Loc == 'Warszawa' & weekend$Hour_numb==i,]
  assign(paste("Warszawa_week", i, sep = "_") , x)      
}

for (i in 1:24)  {      
  x <- weekend[weekend$Loc == 'Wrocław' & weekend$Hour_numb==i,]
  assign(paste("Wrocław_week", i, sep = "_") , x)      
}

for (i in 1:24)  {      
  x <- weekend[weekend$Loc == 'Gdańsk' & weekend$Hour_numb==i,]
  assign(paste("Gdańsk_week", i, sep = "_") , x)      
}

for (i in 1:24)  {      
  x <- weekend[weekend$Loc == 'Kraków' & weekend$Hour_numb==i,]
  assign(paste("Kraków_week", i, sep = "_") , x)      
}

for (i in 1:24)  {      
  x <- weekend[weekend$Loc == 'Łódź' & weekend$Hour_numb==i,]
  assign(paste("Łódź_week", i, sep = "_") , x)      
}

for (i in 1:24)  {      
  x <- weekend[weekend$Loc == 'Nowa Ruda' & weekend$Hour_numb==i,]
  assign(paste("Nowa_Ruda_week", i, sep = "_") , x)      
}


Time <- c("01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00",
          "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00", "24:00")
Warszawa_week <- c(mean(Warszawa_week_1$Value), mean(Warszawa_week_2$Value), mean(Warszawa_week_3$Value), mean(Warszawa_week_4$Value), 
                   mean(Warszawa_week_5$Value), mean(Warszawa_week_6$Value), mean(Warszawa_week_7$Value), mean(Warszawa_week_8$Value),
                   mean(Warszawa_week_9$Value), mean(Warszawa_week_10$Value), mean(Warszawa_week_11$Value), mean(Warszawa_week_12$Value), 
                   mean(Warszawa_week_13$Value), mean(Warszawa_week_14$Value), mean(Warszawa_week_15$Value), mean(Warszawa_week_16$Value), 
                   mean(Warszawa_week_17$Value), mean(Warszawa_week_18$Value), mean(Warszawa_week_19$Value), mean(Warszawa_week_20$Value),
                   mean(Warszawa_week_21$Value), mean(Warszawa_week_22$Value), mean(Warszawa_week_23$Value), mean(Warszawa_week_24$Value)) 
Wrocław_week <- c(mean(Wrocław_week_1$Value), mean(Wrocław_week_2$Value), mean(Wrocław_week_3$Value), mean(Wrocław_week_4$Value), 
                  mean(Wrocław_week_5$Value), mean(Wrocław_week_6$Value), mean(Wrocław_week_7$Value), mean(Wrocław_week_8$Value), 
                  mean(Wrocław_week_9$Value), mean(Wrocław_week_10$Value), mean(Wrocław_week_11$Value), mean(Wrocław_week_12$Value),
                  mean(Wrocław_week_13$Value), mean(Wrocław_week_14$Value), mean(Wrocław_week_15$Value), mean(Wrocław_week_16$Value), 
                  mean(Wrocław_week_17$Value), mean(Wrocław_week_18$Value), mean(Wrocław_week_19$Value), mean(Wrocław_week_20$Value), 
                  mean(Wrocław_week_21$Value), mean(Wrocław_week_22$Value), mean(Wrocław_week_23$Value), mean(Wrocław_week_24$Value))
Gdańsk_week <- c(mean(Gdańsk_week_1$Value), mean(Gdańsk_week_2$Value), mean(Gdańsk_week_3$Value), mean(Gdańsk_week_4$Value), 
                 mean(Gdańsk_week_5$Value), mean(Gdańsk_week_6$Value), mean(Gdańsk_week_7$Value), mean(Gdańsk_week_8$Value),
                 mean(Gdańsk_week_9$Value), mean(Gdańsk_week_10$Value), mean(Gdańsk_week_11$Value), mean(Gdańsk_week_12$Value), 
                 mean(Gdańsk_week_13$Value), mean(Gdańsk_week_14$Value), mean(Gdańsk_week_15$Value), mean(Gdańsk_week_16$Value), 
                 mean(Gdańsk_week_17$Value), mean(Gdańsk_week_18$Value), mean(Gdańsk_week_19$Value), mean(Gdańsk_week_20$Value),
                 mean(Gdańsk_week_21$Value), mean(Gdańsk_week_22$Value), mean(Gdańsk_week_23$Value), mean(Gdańsk_week_24$Value)) 
Kraków_week <- c(mean(Kraków_week_1$Value), mean(Kraków_week_2$Value), mean(Kraków_week_3$Value), mean(Kraków_week_4$Value), 
                 mean(Kraków_week_5$Value), mean(Kraków_week_6$Value), mean(Kraków_week_7$Value), mean(Kraków_week_8$Value),
                 mean(Kraków_week_9$Value), mean(Kraków_week_10$Value), mean(Kraków_week_11$Value), mean(Kraków_week_12$Value), 
                 mean(Kraków_week_13$Value), mean(Kraków_week_14$Value), mean(Kraków_week_15$Value), mean(Kraków_week_16$Value), 
                 mean(Kraków_week_17$Value), mean(Kraków_week_18$Value), mean(Kraków_week_19$Value), mean(Kraków_week_20$Value),
                 mean(Kraków_week_21$Value), mean(Kraków_week_22$Value), mean(Kraków_week_23$Value), mean(Kraków_week_24$Value)) 
Łódź_week <- c(mean(Łódź_week_1$Value), mean(Łódź_week_2$Value), mean(Łódź_week_3$Value), mean(Łódź_week_4$Value), 
               mean(Łódź_week_5$Value), mean(Łódź_week_6$Value), mean(Łódź_week_7$Value), mean(Łódź_week_8$Value),
               mean(Łódź_week_9$Value), mean(Łódź_week_10$Value), mean(Łódź_week_11$Value), mean(Łódź_week_12$Value), 
               mean(Łódź_week_13$Value), mean(Łódź_week_14$Value), mean(Łódź_week_15$Value), mean(Łódź_week_16$Value), 
               mean(Łódź_week_17$Value), mean(Łódź_week_18$Value), mean(Łódź_week_19$Value), mean(Łódź_week_20$Value),
               mean(Łódź_week_21$Value), mean(Łódź_week_22$Value), mean(Łódź_week_23$Value), mean(Łódź_week_24$Value)) 
Nowa_Ruda_week <- c(mean(Nowa_Ruda_week_1$Value), mean(Nowa_Ruda_week_2$Value), mean(Nowa_Ruda_week_3$Value), mean(Nowa_Ruda_week_4$Value), 
                    mean(Nowa_Ruda_week_5$Value), mean(Nowa_Ruda_week_6$Value), mean(Nowa_Ruda_week_7$Value), mean(Nowa_Ruda_week_8$Value),
                    mean(Nowa_Ruda_week_9$Value), mean(Nowa_Ruda_week_10$Value), mean(Nowa_Ruda_week_11$Value), mean(Nowa_Ruda_week_12$Value), 
                    mean(Nowa_Ruda_week_13$Value), mean(Nowa_Ruda_week_14$Value), mean(Nowa_Ruda_week_15$Value), mean(Nowa_Ruda_week_16$Value), 
                    mean(Nowa_Ruda_week_17$Value), mean(Nowa_Ruda_week_18$Value), mean(Nowa_Ruda_week_19$Value), mean(Nowa_Ruda_week_20$Value),
                    mean(Nowa_Ruda_week_21$Value), mean(Nowa_Ruda_week_22$Value), mean(Nowa_Ruda_week_23$Value), mean(Nowa_Ruda_week_24$Value)) 

df_week <- data.frame(Time, Warszawa_week, Wrocław_week, Gdańsk_week, Kraków_week, Łódź_week, Nowa_Ruda_week)





x <- 1:24

png(file="Warszawa_godziny.png", width = 1000, height = 500)
plot(x, df_work$Warszawa, ylim=c(0,72), col="#9F7FE5", lwd=2, cex=1.5, pch=17, cex.lab = 1.5, cex.main = 2.2, cex.axis = 1.5,
     type='b', xlab="Godzina", ylab="Stężenie [µg/m³]", main="Średnie stężenie godzinowe pyłu PM10 w Warszawie", xaxt = "n",)
points(x, df_week$Warszawa, pch = 19, lwd=2, cex=1.5, type='b', col="#E3669B")
legend(20.5, 13, legend=c("Dni robocze", "Weekend"),
       col=c("#9F7FE5", "#E3669B"), lty=c(1,1), pch=c(17,19), cex=1.5)

axis(1, at = 1:24, labels = c("01:00", "", "03:00", "", "05:00", 
                              "", "07:00", "", "09:00", "",
                              "11:00", "", "13:00", "", "15:00",
                              "", "17:00", "", "19:00", "",
                              "21:00", "", "23:00", ""), cex.axis = 1.5)
dev.off()

png(file="Wrocław_godziny.png", width = 1000, height = 500)
plot(x, df_work$Wrocław, ylim=c(0,72), col="#9F7FE5", lwd=2, cex=1.5, pch=17, cex.lab = 1.5, cex.main = 2.2, cex.axis = 1.5,
     type='b', xlab="Godzina", ylab="Stężenie [µg/m³]", main="Średnie stężenie godzinowe pyłu PM10 we Wrocławiu", xaxt = "n",)
points(x, df_week$Wrocław, pch = 19, lwd=2, cex=1.5, type='b', col="#E3669B")
legend(20.5, 13, legend=c("Dni robocze", "Weekend"),
       col=c("#9F7FE5", "#E3669B"), lty=c(1,1), pch=c(17,19), cex=1.5)

axis(1, at = 1:24, labels = c("01:00", "", "03:00", "", "05:00", 
                              "", "07:00", "", "09:00", "",
                              "11:00", "", "13:00", "", "15:00",
                              "", "17:00", "", "19:00", "",
                              "21:00", "", "23:00", ""), cex.axis = 1.5)
dev.off()

png(file="Gdańsk_godziny.png", width = 1000, height = 500)
plot(x, df_work$Gdańsk, ylim=c(0,72), col="#9F7FE5",lwd=2, cex=1.5, pch=17, cex.lab = 1.5, cex.main = 2.2, cex.axis = 1.5,
     type='b', xlab="Godzina", ylab="Stężenie [µg/m³]", main="Średnie stężenie godzinowe pyłu PM10 w Gdańsku", xaxt = "n",)
points(x, df_week$Gdańsk, pch = 19, lwd=2, cex=1.5, type='b', col="#E3669B")
legend(20.5, 13, legend=c("Dni robocze", "Weekend"),
       col=c("#9F7FE5", "#E3669B"), lty=c(1,1), pch=c(17,19), cex=1.5)

axis(1, at = 1:24, labels = c("01:00", "", "03:00", "", "05:00", 
                              "", "07:00", "", "09:00", "",
                              "11:00", "", "13:00", "", "15:00",
                              "", "17:00", "", "19:00", "",
                              "21:00", "", "23:00", ""), cex.axis = 1.5)
dev.off()


png(file="Kraków_godziny.png", width = 1000, height = 500)
plot(x, df_work$Kraków, ylim=c(0,72), col="#9F7FE5", lwd=2, cex=1.5, pch=17, cex.lab = 1.5, cex.main = 2.2, cex.axis = 1.5,
     type='b', xlab="Godzina", ylab="Stężenie [µg/m³]", main="Średnie stężenie godzinowe pyłu PM10 w Krakowie", xaxt = "n",)
points(x, df_week$Kraków, pch = 19, lwd=2, cex=1.5, type='b', col="#E3669B")
legend(20.5, 13, legend=c("Dni robocze", "Weekend"),
       col=c("#9F7FE5", "#E3669B"), lty=c(1,1), pch=c(17,19), cex=1.5)

axis(1, at = 1:24, labels = c("01:00", "", "03:00", "", "05:00", 
                              "", "07:00", "", "09:00", "",
                              "11:00", "", "13:00", "", "15:00",
                              "", "17:00", "", "19:00", "",
                              "21:00", "", "23:00", ""), cex.axis = 1.5)
dev.off()

png(file="Łódź_godziny.png", width = 1000, height = 500)
plot(x, df_work$Łódź, ylim=c(0,72), col="#9F7FE5", lwd=2, cex=1.5, pch=17, cex.lab = 1.5, cex.main = 2.2, cex.axis = 1.5,
     type='b', xlab="Godzina", ylab="Stężenie [µg/m³]", main="Średnie stężenie godzinowe pyłu PM10 w Łodzi", xaxt = "n",)
points(x, df_week$Łódź, pch = 19, lwd=2, cex=1.5, type='b', col="#E3669B")
legend(20.5, 13, legend=c("Dni robocze", "Weekend"),
       col=c("#9F7FE5", "#E3669B"), lty=c(1,1), pch=c(17,19), cex=1.5)

axis(1, at = 1:24, labels = c("01:00", "", "03:00", "", "05:00", 
                              "", "07:00", "", "09:00", "",
                              "11:00", "", "13:00", "", "15:00",
                              "", "17:00", "", "19:00", "",
                              "21:00", "", "23:00", ""), cex.axis = 1.5)
dev.off()


png(file="Nowa_Ruda_godziny.png", width = 1000, height = 500)
plot(x, df_work$Nowa_Ruda, ylim=c(0,72), col="#9F7FE5", lwd=2, cex=1.5, pch=17, cex.lab = 1.5, cex.main = 2.2, cex.axis = 1.5,
     type='b', xlab="Godzina", ylab="Stężenie [µg/m³]", main="Średnie stężenie godzinowe pyłu PM10 w Nowej Rudzie", xaxt = "n",)
points(x, df_week$Nowa_Ruda, pch = 19, lwd=2, cex=1.5, type='b', col="#E3669B")
legend(20.5, 13, legend=c("Dni robocze", "Weekend"),
       col=c("#9F7FE5", "#E3669B"), lty=c(1,1), pch=c(17,19), cex=1.5)

axis(1, at = 1:24, labels = c("01:00", "", "03:00", "", "05:00", 
                              "", "07:00", "", "09:00", "",
                              "11:00", "", "13:00", "", "15:00",
                              "", "17:00", "", "19:00", "",
                              "21:00", "", "23:00", ""), cex.axis = 1.5)
dev.off()
