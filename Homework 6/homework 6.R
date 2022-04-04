setwd("D:/")
install.packages("ggplot2")
install.packages("tidyr")
install.packages("dplyr")
library(ggplot2)
library(tidyr)
library(dplyr)

load("D:/house_prices.rda")
ggplot(data=house_prices, aes(x = date, y = house_price_index)) + geom_line() + facet_wrap(~state) #+ 
    scale_x_continuous(name = "Year", breaks = c("80", "00", "20"))

house_reshaped <- house_prices %>% gather(house_price_index, unemploy_perc, date, ~state, ~house_price_perc)

ggplot(data=house_reshaped, aes(x = date, y = unemploy_perc)) + geom_line() + facet_wrap(house_price_index)

write.csv(house_prices, "D:/house_prices.csv", row.names = FALSE)
