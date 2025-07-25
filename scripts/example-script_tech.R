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

#### Load base plots ####
source("base_plots/base_plots.R")

#### Design theme ####
source("themes/theme_tech.R")

#### test themes ####
test_themes <- function(plots,
                        theme,
                        theme_label){
  plots +
    theme +
    labs(subtitle = theme_label)
  
}

#### Run plots ####

base_plots %>%
  map(test_themes,
      theme = theme_tech(),
      theme_label = "theme: theme_tech()") %>%
  reduce(`+`)
