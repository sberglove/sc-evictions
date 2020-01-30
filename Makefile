# Search path
VPATH = data eda scripts

# Processed data files
DATA = boundaries.rds evictions.rds evictions_boundaries.rds

# EDA studies
EDA = evictions_boundaries.md

# Reports
REPORTS = 

# All targets
all : $(DATA) $(EDA) $(REPORTS)

# Data dependencies
evictions_boundaries.rds : evictions.rds boundaries.rds

# EDA study and report dependencies
evictions_boundaries.md : evictions_boundaries.rds

# Pattern rules
%.rds : %.R
	Rscript $<
%.md : %.Rmd
	Rscript -e 'rmarkdown::render(input = "$<", output_options = list(html_preview = FALSE))'
