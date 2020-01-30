# Reads in and writes out South Carolina eviction data.

# Source: This research uses data from The Eviction Lab at Princeton University, 
#         a project directed by Matthew Desmond and designed by Ashley Gromis, 
#         Lavar Edmonds, James Hendrickson, Katie Krywokulski, Lillian Leung, 
#         and Adam Porton. The Eviction Lab is funded by the JPB, Gates, and 
#         Ford Foundations as well as the Chan Zuckerberg Initiative. More 
#         information is found at evictionlab.org.

# Author: Sara Berg-Love
# Version: 2020-01-29

# Libraries
library(tidyverse)

# Parameters
  # Input url
url_evictions <- 
  "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.csv"
  # Variable types
vars_types <-
  cols_only(
    GEOID = col_double(),
    year = col_double(),
    name = col_character(),
    evictions = col_double()
  )
  # Output file
file_out <- here::here("data/evictions.rds")

#===============================================================================

url_evictions %>% 
  read_csv(col_types = vars_types) %>% 
  rename_all(str_to_lower) %>% 
  filter(year == 2016) %>% 
  write_rds(file_out)
