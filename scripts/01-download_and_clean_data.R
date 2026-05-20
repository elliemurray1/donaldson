#### Preamble ####
# Purpose: Downloads and saves the data from the City of Toronto's Daily Shelter & Overnight Service Occupancy & Capacity datasets (2025-26). Makes a new column to group the daily data by month for tables and figures.
# Author: Ellie Murray 
# Date: 7 May 2026


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(ggrepel)
library(magrittr)
library(here)


#dataset 2026
data2026 <- read_csv(here("data/01-raw_data/daily-shelter-data-2026.csv"))
data2026 <- data2026 %>%
  mutate(
    OCCUPANCY_DATE = as.Date(OCCUPANCY_DATE),
    month = floor_date(OCCUPANCY_DATE, "month"),
    OCCUPIED_BEDS = as.numeric(OCCUPIED_BEDS)
  ) %>%
  filter(!is.na(OCCUPIED_BEDS)) %>%
  mutate(month_label = format(month, "%b %Y"))


#dataset 2025
data2025 <- read_csv(here("data/01-raw_data/daily-shelter-data-2025.csv"))


data2025 <- data2025 %>%
  mutate(
    OCCUPANCY_DATE = as.Date(OCCUPANCY_DATE),
    month = floor_date(OCCUPANCY_DATE, "month"),
    OCCUPIED_BEDS = as.numeric(OCCUPIED_BEDS)
  ) %>%
  filter(!is.na(OCCUPIED_BEDS)) %>%
  mutate(month_label = format(month, "%b %Y"))


#### Save data ####
write_csv(data2025, "data/02-analysis_data/shelter_analysis_data_2025.csv")
write_csv(data2026, "data/02-analysis_data/shelter_analysis_data_2026.csv")





