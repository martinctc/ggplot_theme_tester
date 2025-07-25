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

#### Load new themes ####
source("themes/theme_minimal_dark.R")
source("themes/theme_retro.R")
source("themes/theme_academic.R")
source("themes/theme_neon.R")
source("themes/theme_nature.R")
source("themes/theme_corporate.R")
source("themes/theme_vintage.R")
source("themes/theme_tech.R")

#### test themes function ####
test_themes <- function(plots,
                        theme,
                        theme_label){
  plots +
    theme +
    labs(subtitle = theme_label)
}

#### Create a single test plot for comparison ####
sample_plot <- base_plots[[1]]  # Use the first plot from base_plots

#### Test all new themes ####

# Minimal Dark Theme
p1 <- sample_plot + 
  theme_minimal_dark() + 
  labs(title = "Minimal Dark Theme", subtitle = "Clean and modern dark design")

# Retro Theme  
p2 <- sample_plot + 
  theme_retro() + 
  labs(title = "Retro Theme", subtitle = "80s/90s inspired cyberpunk style")

# Academic Theme
p3 <- sample_plot + 
  theme_academic() + 
  labs(title = "Academic Theme", subtitle = "Professional publication style")

# Neon Theme
p4 <- sample_plot + 
  theme_neon() + 
  labs(title = "Neon Theme", subtitle = "Bright cyberpunk aesthetics")

# Nature Theme
p5 <- sample_plot + 
  theme_nature() + 
  labs(title = "Nature Theme", subtitle = "Earth tones and organic feeling")

# Corporate Theme
p6 <- sample_plot + 
  theme_corporate() + 
  labs(title = "Corporate Theme", subtitle = "Modern business presentation style")

# Vintage Theme
p7 <- sample_plot + 
  theme_vintage() + 
  labs(title = "Vintage Theme", subtitle = "Classic newspaper/magazine style")

# Tech Theme
p8 <- sample_plot + 
  theme_tech() + 
  labs(title = "Tech Theme", subtitle = "Modern tech company design")

#### Combine all themes for comparison ####
(p1 + p2) / (p3 + p4) / (p5 + p6) / (p7 + p8)

#### Alternative: Test each theme with all base plots ####

# Uncomment the section below to test a specific theme with all base plots:

# # Example with Corporate Theme
# base_plots %>%
#   map(test_themes,
#       theme = theme_corporate(),
#       theme_label = "theme: theme_corporate()") %>%
#   reduce(`+`)
