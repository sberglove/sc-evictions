# Read in and writes out South Carolina city boundaries data.

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
url_boundaries <- 
  "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/block-groups.geojson"
  # Output file
file_out <- here::here("data/boundaries.rds")

#===============================================================================

url_boundaries %>% 
  sf::read_sf() %>% 
  rename_all(str_to_lower) %>% 
  select(geoid, pl, geometry) %>% 
  transmute("geoid" = as.double(geoid), "name" = as.character(pl), geometry) %>% 
  write_rds(file_out)
