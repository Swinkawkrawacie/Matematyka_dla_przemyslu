library(dplyr)
library(ggplot2)
library(tidyverse)

df <- read.csv2('data.csv', sep=",", fileEncoding = "UTF-8")
names(df) <- c("X","Year", "Month", "Day", "Loc", "Type", "Value")

df_w <- read.csv2('average_daily_weather.csv', sep=",", fileEncoding = "UTF-8")
names(df_w) <- c("Loc", "Day", "Month", "Year",  "Temperature", "Wind", "Humidity")

wars_val <- df[df$Loc == 'Kraków' & df$Type == "PM10" & (df$Year=="2019" | df$Year=="2018" | 
                                                            df$Year=="2017" | df$Year=="2016" | df$Year=="2015"),]
wars_data1 <- wars_val %>% select(Value)

wars_weather1 <- df_w[df_w$Loc == 'Kraków' & (df_w$Year=="2019" | df_w$Year=="2018" | 
                                                 df_w$Year=="2017" | df_w$Year=="2016" | df_w$Year=="2015"),]

wars_weather <- wars_weather1[order(wars_weather1$Year, decreasing = TRUE), ]   


wars_data2 <- wars_weather %>% select(Temperature, Wind, Humidity)

total <- cbind(wars_data1, wars_data2)

total$Value <- as.numeric(total$Value)                
total$Wind <- as.numeric(total$Wind)
total$Temperature <- as.numeric(total$Temperature) 
total$Humidity <- as.numeric(total$Humidity) 

str(total)

#plot(total$Wind, total$Value, main="Scatterplot Example",
#     xlab="Wind ", ylab="Val ", pch=19)

final3 <- total[total$Wind != 0, ] 
final2 <- final3[final3$Wind < 15, ]  


final <- final2 %>% drop_na(Value)
final_w <- final %>% drop_na(Wind)
final_t <- final %>% drop_na(Temperature)
final_h <- final %>% drop_na(Humidity)


wind_arr <- final_w %>% arrange(Wind)
temp_arr <- final_t %>% arrange(Temperature)
hum_arr <- final_h %>% arrange(Humidity)

temp_1 <- sum(final_t$Temperature > 10 & final_t$Value > 50)/sum(final_t$Value > 50)
temp_2 <- sum(final_t$Temperature < 10 & final_t$Value > 50)/sum(final_t$Value > 50)




temp_1 <- sum(final_t$Temperature > 10 & final_t$Value > 50)/sum(final_t$Temperature > 10)
temp_2 <- sum(final_t$Temperature < 10 & final_t$Value > 50)/sum(final_t$Temperature < 10)

temp_1 <- sum(final_w$Wind >= 5 & final_w$Value > 50)/sum(final_w$Value > 50)
temp_2 <- sum(final_w$Wind < 5 & final_w$Value > 50)/sum(final_w$Value > 50)

temp_1 <- sum(final_h$Humidity >= 6.5 & final_h$Value > 50)/sum(final_h$Value > 50)
temp_2 <- sum(final_h$Humidity < 6.5 & final_h$Value > 50)/sum(final_h$Value > 50)

wind_value_plot <- ggplot(wind_arr,  mapping=aes(x=Wind, y=Value)) +
  geom_point(aes(col='Wartość'), size=2.5) +
  ggtitle('Kraków') +
  guides(color = 'none') + scale_color_manual(values = 'violetred3') + 
  ylab('Stężenie PM10 [µg/m³]') + xlab('Prędkość wiatru [m/s]') +
  geom_smooth(color = "darkorchid4", se=FALSE) +
  theme(plot.title = element_text(hjust=0.5)) + 
  theme(axis.text = element_text(size = 30))  +
  theme(text = element_text(size=40))

temp_value_plot <- ggplot(temp_arr,  mapping=aes(x=Temperature, y=Value)) +
  geom_point(aes(col='Wartość'), size=2.5) +
  ggtitle('Kraków') +
  guides(color = 'none') + scale_color_manual(values = 'violetred3') + 
  ylab('Stężenie PM10 [µg/m³]') + xlab('Temperatura [\u00B0C]') +
  geom_smooth(color = "darkorchid4", se=FALSE) +
  theme(plot.title = element_text(hjust=0.5)) + 
  theme(axis.text = element_text(size = 30))  +
  theme(text = element_text(size=40))

hum_value_plot <- ggplot(hum_arr,  mapping=aes(x=Humidity, y=Value)) +
  geom_point(aes(col='Wartość'), size=2.5) +
  ggtitle('Kraków') +
  guides(color = 'none') + scale_color_manual(values = 'violetred3') + 
  ylab('Stężenie PM10 [µg/m³]') + xlab('Wilgotność [g/m³]') +
  geom_smooth(color = "darkorchid4", se=FALSE) +
  theme(plot.title = element_text(hjust=0.5)) + 
  theme(axis.text = element_text(size = 30))  +
  theme(text = element_text(size=40))

png(file="Krakow_wiatr.png", width = 1400, height = 800)
wind_value_plot 
dev.off()

png(file="Krakow_temp.png", width = 1400, height = 800)
temp_value_plot
dev.off()

png(file="Krakow_wilg.png", width = 1400, height = 800)
hum_value_plot 
dev.off()



final_f <- na.omit(final)
correlation = final_f %>% 
  select(Value, Wind, Temperature, Humidity)

we_cor_p = round(cor(correlation),2)

we_cor_sp = round(cor(correlation, method="spearman"),2)
