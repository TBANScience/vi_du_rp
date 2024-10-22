getwd()
library(here)
library(tidyverse)
library(readxl)
here()
data <- read_excel(here("data_xlsx.xlsx"))
str(data)
View(data)
glimpse(data)
head(data)
names(data)
data %>% 
  dplyr::filter(Country == "Oman") %>% 
  head()
