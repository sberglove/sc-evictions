Evictions in South Carolina
================
Sara Berg-Love
2020-01-29

  - [Summary](#summary)
  - [Evictions by city](#evictions-by-city)

``` r
# Libraries
library(tidyverse)

# Parameters
file_data <- here::here("data/evictions_boundaries.rds")
  
#===============================================================================

df <- read_rds(file_data)
```

## Summary

``` r
df %>% 
  select(-geometry) %>% 
  summary()
```

    ##      geoid             name             evictions      
    ##  Min.   :4500100   Length:397         Min.   :   0.00  
    ##  1st Qu.:4523335   Class :character   1st Qu.:   1.85  
    ##  Median :4541965   Mode  :character   Median :  13.40  
    ##  Mean   :4541853                      Mean   :  87.69  
    ##  3rd Qu.:4561495                      3rd Qu.:  51.55  
    ##  Max.   :4579630                      Max.   :3660.10  
    ##                                       NA's   :114

## Evictions by city

``` r
df %>% 
  top_n(1, evictions)
```

    ## # A tibble: 1 x 4
    ##     geoid name             evictions geometry
    ##     <dbl> <chr>                <dbl> <list>  
    ## 1 4550875 North Charleston     3660. <NULL>

North Charleston had the most evictions in South Carolina in 2016, 3,660
evictions.
