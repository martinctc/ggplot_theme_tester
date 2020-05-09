library(tidyverse)
library(patchwork)
library(extrafont)
library(ggthemes)

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
## Not needed - loads theme from {ggthemes}


#### Run plots ####

run_themes(plots = base_plots1,
           themes = ggthemes::theme_economist(),
           theme_labels = "theme: theme_economist")

run_themes(plots = base_plots2,
           themes = ggthemes::theme_economist(),
           theme_labels = "theme: theme_economist")
