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


for (i in 1:24)  {      
  x <- air_data[air_data$Loc == 'Warszawa' & air_data$Hour_numb==i & (air_data$Month == 6 | air_data$Month == 7 | air_data$Month == 8),]
  assign(paste("Warszawa", i, sep = "_") , x)      
}

for (i in 1:24)  {      
  x <- air_data[air_data$Loc == 'Wrocław' & air_data$Hour_numb==i & (air_data$Month == 6 | air_data$Month == 7 | air_data$Month == 8),]
  assign(paste("Wrocław", i, sep = "_") , x)      
}

for (i in 1:24)  {      
  x <- air_data[air_data$Loc == 'Gdańsk' & air_data$Hour_numb==i & (air_data$Month == 6 | air_data$Month == 7 | air_data$Month == 8),]
  assign(paste("Gdańsk", i, sep = "_") , x)      
}

for (i in 1:24)  {      
  x <- air_data[air_data$Loc == 'Kraków' & air_data$Hour_numb==i & (air_data$Month == 6 | air_data$Month == 7 | air_data$Month == 8),]
  assign(paste("Kraków", i, sep = "_") , x)      
}

for (i in 1:24)  {      
  x <- air_data[air_data$Loc == 'Łódź' & air_data$Hour_numb==i & (air_data$Month == 6 | air_data$Month == 7 | air_data$Month == 8),]
  assign(paste("Łódź", i, sep = "_") , x)      
}

for (i in 1:24)  {      
  x <- air_data[air_data$Loc == 'Nowa Ruda' & air_data$Hour_numb==i & (air_data$Month == 6 | air_data$Month == 7 | air_data$Month == 8),]
  assign(paste("Nowa_Ruda", i, sep = "_") , x)      
}



Time <- c("01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00",
          "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00", "24:00")
Warszawa <- c(mean(Warszawa_1$Value), mean(Warszawa_2$Value), mean(Warszawa_3$Value), mean(Warszawa_4$Value), 
              mean(Warszawa_5$Value), mean(Warszawa_6$Value), mean(Warszawa_7$Value), mean(Warszawa_8$Value),
              mean(Warszawa_9$Value), mean(Warszawa_10$Value), mean(Warszawa_11$Value), mean(Warszawa_12$Value), 
              mean(Warszawa_13$Value), mean(Warszawa_14$Value), mean(Warszawa_15$Value), mean(Warszawa_16$Value), 
              mean(Warszawa_17$Value), mean(Warszawa_18$Value), mean(Warszawa_19$Value), mean(Warszawa_20$Value),
              mean(Warszawa_21$Value), mean(Warszawa_22$Value), mean(Warszawa_23$Value), mean(Warszawa_24$Value)) 
Wrocław <- c(mean(Wrocław_1$Value), mean(Wrocław_2$Value), mean(Wrocław_3$Value), mean(Wrocław_4$Value), 
             mean(Wrocław_5$Value), mean(Wrocław_6$Value), mean(Wrocław_7$Value), mean(Wrocław_8$Value), 
             mean(Wrocław_9$Value), mean(Wrocław_10$Value), mean(Wrocław_11$Value), mean(Wrocław_12$Value),
             mean(Wrocław_13$Value), mean(Wrocław_14$Value), mean(Wrocław_15$Value), mean(Wrocław_16$Value), 
             mean(Wrocław_17$Value), mean(Wrocław_18$Value), mean(Wrocław_19$Value), mean(Wrocław_20$Value), 
             mean(Wrocław_21$Value), mean(Wrocław_22$Value), mean(Wrocław_23$Value), mean(Wrocław_24$Value))
Gdańsk <- c(mean(Gdańsk_1$Value), mean(Gdańsk_2$Value), mean(Gdańsk_3$Value), mean(Gdańsk_4$Value), 
            mean(Gdańsk_5$Value), mean(Gdańsk_6$Value), mean(Gdańsk_7$Value), mean(Gdańsk_8$Value),
            mean(Gdańsk_9$Value), mean(Gdańsk_10$Value), mean(Gdańsk_11$Value), mean(Gdańsk_12$Value), 
            mean(Gdańsk_13$Value), mean(Gdańsk_14$Value), mean(Gdańsk_15$Value), mean(Gdańsk_16$Value), 
            mean(Gdańsk_17$Value), mean(Gdańsk_18$Value), mean(Gdańsk_19$Value), mean(Gdańsk_20$Value),
            mean(Gdańsk_21$Value), mean(Gdańsk_22$Value), mean(Gdańsk_23$Value), mean(Gdańsk_24$Value)) 
Kraków <- c(mean(Kraków_1$Value), mean(Kraków_2$Value), mean(Kraków_3$Value), mean(Kraków_4$Value), 
            mean(Kraków_5$Value), mean(Kraków_6$Value), mean(Kraków_7$Value), mean(Kraków_8$Value),
            mean(Kraków_9$Value), mean(Kraków_10$Value), mean(Kraków_11$Value), mean(Kraków_12$Value), 
            mean(Kraków_13$Value), mean(Kraków_14$Value), mean(Kraków_15$Value), mean(Kraków_16$Value), 
            mean(Kraków_17$Value), mean(Kraków_18$Value), mean(Kraków_19$Value), mean(Kraków_20$Value),
            mean(Kraków_21$Value), mean(Kraków_22$Value), mean(Kraków_23$Value), mean(Kraków_24$Value)) 
Łódź <- c(mean(Łódź_1$Value), mean(Łódź_2$Value), mean(Łódź_3$Value), mean(Łódź_4$Value), 
          mean(Łódź_5$Value), mean(Łódź_6$Value), mean(Łódź_7$Value), mean(Łódź_8$Value),
          mean(Łódź_9$Value), mean(Łódź_10$Value), mean(Łódź_11$Value), mean(Łódź_12$Value), 
          mean(Łódź_13$Value), mean(Łódź_14$Value), mean(Łódź_15$Value), mean(Łódź_16$Value), 
          mean(Łódź_17$Value), mean(Łódź_18$Value), mean(Łódź_19$Value), mean(Łódź_20$Value),
          mean(Łódź_21$Value), mean(Łódź_22$Value), mean(Łódź_23$Value), mean(Łódź_24$Value)) 
Nowa_Ruda <- c(mean(Nowa_Ruda_1$Value), mean(Nowa_Ruda_2$Value), mean(Nowa_Ruda_3$Value), mean(Nowa_Ruda_4$Value), 
               mean(Nowa_Ruda_5$Value), mean(Nowa_Ruda_6$Value), mean(Nowa_Ruda_7$Value), mean(Nowa_Ruda_8$Value),
               mean(Nowa_Ruda_9$Value), mean(Nowa_Ruda_10$Value), mean(Nowa_Ruda_11$Value), mean(Nowa_Ruda_12$Value), 
               mean(Nowa_Ruda_13$Value), mean(Nowa_Ruda_14$Value), mean(Nowa_Ruda_15$Value), mean(Nowa_Ruda_16$Value), 
               mean(Nowa_Ruda_17$Value), mean(Nowa_Ruda_18$Value), mean(Nowa_Ruda_19$Value), mean(Nowa_Ruda_20$Value),
               mean(Nowa_Ruda_21$Value), mean(Nowa_Ruda_22$Value), mean(Nowa_Ruda_23$Value), mean(Nowa_Ruda_24$Value)) 

df <- data.frame(Time, Warszawa, Wrocław, Gdańsk, Kraków, Łódź, Nowa_Ruda)

x <- 1:24
png(file="lato.png", width = 1000, height = 500)
plot(x, df$Warszawa, ylim=c(0,120), col="#CE7D3B", pch=0, cex.lab = 1.5, cex.main = 2.2, cex.axis = 1.5,
     type='b', xlab="Godzina", ylab="Stężenie [µg/m³]", main="Średnie stężenie godzinowe pyłu PM10 - lato", xaxt = "n",)
points(x, df$Wrocław, pch = 19, type='b', col="#6F9F00")
points(x, df$Gdańsk, pch=2, type='b', col="#00AD86")
points(x, df$Kraków, pch=8, type='b', col="#009ADE")
points(x, df$Łódź, pch=3, type='b', col="#9F7FE5")
points(x, df$Nowa_Ruda, pch=18, lwd=2, type='b', col="#E3669B")
legend(0.4, 120, legend=c("Warszawa", "Wrocław", "Gdańsk", "Kraków", "Łódź", "Nowa Ruda"),
       col=c("#CE7D3B", "#6F9F00", "#00AD86", "#009ADE", "#9F7FE5", "#E3669B"), lty=c(1,1,1,1,1,1), pch=c(0,19,2,8,3,18), cex=1)

axis(1, at = 1:24, labels = c("01:00", "", "03:00", "", "05:00", 
                              "", "07:00", "", "09:00", "",
                              "11:00", "", "13:00", "", "15:00",
                              "", "17:00", "", "19:00", "",
                              "21:00", "", "23:00", ""), cex.axis = 1.5)
dev.off()