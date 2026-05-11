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

data <- read_csv("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/21c83b32-d5a8-4106-a54f-010dbe49f6f2/resource/ffd20867-6e3c-4074-8427-d63810edf231/download/Daily%20shelter%20overnight%20occupancy.csv")

write_csv(data, "data/01-raw_data/data.csv")
