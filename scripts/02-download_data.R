#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Ellie Murray 
# Date: 7 May 2026
# Contact: ellie.murray@dal.ca
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(ggrepel)
library(magrittr)

data <- read_csv("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/21c83b32-d5a8-4106-a54f-010dbe49f6f2/resource/ffd20867-6e3c-4074-8427-d63810edf231/download/Daily%20shelter%20overnight%20occupancy.csv")

write_csv(data, "data/01-raw_data/data.csv")


#dataset 2026
data2026 <- read_csv("Daily shelter overnight occupancy (4).csv")
data2026 <- data2026 %>%
  mutate(
    OCCUPANCY_DATE = as.Date(OCCUPANCY_DATE),
    month = floor_date(OCCUPANCY_DATE, "month"),
    OCCUPIED_BEDS = as.numeric(OCCUPIED_BEDS)
  ) %>%
  filter(!is.na(OCCUPIED_BEDS)) %>%
  mutate(month_label = format(month, "%b %Y"))


#dataset 2024
data2024 <- read_csv("data/daily-shelter-overnight-service-occupancy-capacity-2024.csv")


#dataset 2025
data2025 <- read_csv("data/daily-shelter-overnight-service-occupancy-capacity-2025 (3).csv")



data2025 <- data2025 %>%
  mutate(
    OCCUPANCY_DATE = as.Date(OCCUPANCY_DATE),
    month = floor_date(OCCUPANCY_DATE, "month"),
    OCCUPIED_BEDS = as.numeric(OCCUPIED_BEDS)
  ) %>%
  filter(!is.na(OCCUPIED_BEDS)) %>%
  mutate(month_label = format(month, "%b %Y"))








