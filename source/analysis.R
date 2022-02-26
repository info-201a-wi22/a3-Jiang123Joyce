library(readxl)
library(dplyr)
data_in_2000 <- read_excel("~/Desktop/Assignment 3/a3-Jiang123Joyce/source/2000 Five Radom Pop Data.xlsx")
View(data_in_2000)
data_in_2018 <- read_excel("~/Desktop/Assignment 3/a3-Jiang123Joyce/source/2018 Five Radom Pop Data.xlsx")
View(data_in_2018)
highest_total_in_2000 <- max(data_in_2000$`Total Jail Pop`)
print(highest_total_in_2000)
lowest_total_in_2000 <- min(data_in_2000$`Total Jail Pop`)
print(lowest_total_in_2000)
highest_total_in_2018 <- max(data_in_2018$`Total Jail pop`)
print(highest_total_in_2018)
lowest_total_in_2018 <- min(data_in_2018$`Total Jail pop`)
print(lowest_total_in_2018)
highest_female_2000 <- max(data_in_2000$`Female Jail Pop`)
print(highest_female_2000)
highest_male_2000 <- max(data_in_2000$`Male Jail Pop`)
print(highest_male_2000)
highest_female_2018 <- max(data_in_2018$`Female Jail Pop`)
print(highest_female_2018)
highest_male_2018 <- max(data_in_2018$`Male jail Pop`)
print(highest_male_2018)
mean_total_2000 <- mean(data_in_2000$`Total Jail Pop`)
print(mean_total_2000)
mean_total_2018 <- mean(data_in_2018$`Total Jail pop`)
print(mean_total_2018)
# Chart
## Trends over time chart
AL <- c(11716.91, 15184.00)
CA <- c(75828.78, 76339.00)
DC <- c(1560.00, 2063.00)
FL <- c(51779.00, 2063.00)
GA <- c(23115.13, 43468.01)
g_range <- range(0, AL, CA, DC, FL, GA)
plot(AL, type="o", col="blue", ylim=g_range, axes=FALSE, ann=FALSE) 
axis(1, at=1:2, lab=c("2000", "2018"))
axis(2, las=1, at=10000*0:g_range[2])               
box()   
lines(CA, type="o", pch=22, lty=2, col="red")
lines(DC, type="o", pch=23, lty=3, col="black")
lines(FL, type="o", pch=23, lty=3, col="Pink")
lines(GA, type="o", pch=23, lty=3, col="green")

title(main="Jail population in different counties from 2000 to 2018", col.main="black", font.main=4)
title(xlab="Years", col.lab=rgb(0,0.5,0))
title(ylab="Total", col.lab=rgb(0,0.5,0))  

legend("topleft", c("AL","CA", "DC", "FL", "GA"), cex=0.8, col=c("blue","red", "black", "pink", "green"), 
       lty=1:5, lwd=2, bty="n")


## Variable comparison chart
State <- c(rep("AL",2), rep("CA",2), rep("DC",2), rep("FL",2), rep("GA",2))
Gender <- rep(c("female", "male"),5)
Population <- c(1401.34, 10659.30, 10262.69, 66200.84, 57.00, 1506.00, 6398.82, 45139.49, 2524.78, 20833.22)
FM_2000 <- data_frame(State,Gender, Population)
View(FM_2000)
ggplot(FM_2000, aes(fill=Gender, y=Population, x=State)) + 
  geom_bar(position="dodge", stat="identity")+
  title(main = "Female Jail Population vs. Male Jail Population", col.main="black", font.main=4)

## Map
install.packages("maps")
library(maps)
install.packages("tmap")
library(tmap)
install.packages("leaflet")
library(leaflet)
library(sp)
install.packages("raster")
library(raster)
library(tidyverse)
library(dplyr)
install.packages("ggmap")
library(ggmap)

map <- get_stamenmap(
  bbox = c(left = -133.77, bottom = 8.32, right = -51.33, top = 62.02),
  maptype = "toner",
  zoom = 4
)
ggmap(map)
