# Joins and writes out the South Carolina evictions and boundaries data.

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
  # Eviction data file
file_evictions <- here::here("data/evictions.rds")
  # Boundaries data file
file_boundaries <- here::here("data/boundaries.rds")
  # Output file
file_out <- here::here("data/evictions_boundaries.rds")

#===============================================================================

boundaries <-
  file_boundaries %>% 
  read_rds()

file_evictions %>% 
  read_rds() %>% 
  left_join(boundaries, by = c("geoid", "name")) %>% 
  select(-year) %>% 
  write_rds(file_out)
