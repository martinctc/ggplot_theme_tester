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
source("base_plots/create_baseplots.R")
# source("base_plots/base_plots2.R")

#### Design theme ####
source("themes/theme_executive.R")


#### Run plots ####
## See `create_baseplots.R`
## See `brands_pal.R`

run_themes_withpal(palette = "msft",
                   themes = theme_executive(),
                   theme_labels = "theme: theme_executive\npalette: msft")

run_themes_withpal(palette = "ig",
                   themes = theme_executive(),
                   theme_labels = "theme: theme_executive\npalette: ig")

run_themes_withpal(palette = "google",
                   themes = theme_executive(),
                   theme_labels = "theme: theme_executive\npalette: google")


run_themes_withpal(palette = "mck",
                   themes = theme_executive(),
                   theme_labels = "theme: theme_executive\npalette: mck")

run_themes_withpal(palette = "bain",
                   themes = theme_executive(),
                   theme_labels = "theme: theme_executive\npalette: bain")
