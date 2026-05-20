#### Preamble ####
# Purpose: Cleans the original raw data from 2026 to make preliminary table 
# Author: Ellie Murray


#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Clean data ####
raw_data <- read_csv("data/01-raw_data/data.csv")

toronto_shelters_clean <-
  clean_names(raw_data) |>
  mutate(occupancy_date = ymd(occupancy_date)) |>
  select(occupancy_date, occupied_beds)

#### Save data ####
write_csv(toronto_shelters_clean, "data/02-analysis_data/analysis_data.csv")
