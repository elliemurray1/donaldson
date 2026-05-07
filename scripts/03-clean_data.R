#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Ellie Murray
# Date: [...UPDATE THIS...]
# Contact: [...UPDATE THIS...]
# License: 
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

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
