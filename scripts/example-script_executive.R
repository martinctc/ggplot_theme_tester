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
source("base_plots/base_plots2.R")
# source("base_plots/base_plots2.R")

#### Design theme ####
source("themes/theme_executive.R")


#### Run plots ####

run_themes(plots = base_plots,
           themes = theme_executive(),
           theme_labels = "theme: theme_executive")
