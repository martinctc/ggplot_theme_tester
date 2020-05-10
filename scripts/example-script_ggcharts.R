library(tidyverse)
library(patchwork)
library(extrafont)


#### Run initialisation step below for fonts ####
## Only need to do it once
## https://stackoverflow.com/questions/34522732/changing-fonts-in-ggplot2
##
## Load {extrafont} everytime
# library(extrafont)
# font_import()
# loadfonts(device = "win")


#### Load in function for testing themes ####
source("scripts/test_themes.R")

#### Load base plots ####
source("base_plots/base_plots.R")
base_plots1 <- base_plots
source("base_plots/base_plots3.R")
base_plots2 <- base_plots

#### Design theme ####
source("themes/theme_ggcharts.R")


#### Run plots ####

list("theme_ggcharts()",
     "theme_hermit()",
     "theme_ng()",
     "theme_nightblue()") %>%
  map(function(x){
    
    run_themes(plots = base_plots2,
               themes = eval(parse(text = x)),
               theme_labels = paste0("theme: ggcharts::", x))
    
    clean_nm <- stringr::str_remove_all(x, "\\(|\\)")
    
    file_name <- paste0("examples/example_", clean_nm, "2.png")

    ggsave(filename = file_name,
           width = 35.5,
           height = 19.8,
           units = "cm")
    
  })
  


