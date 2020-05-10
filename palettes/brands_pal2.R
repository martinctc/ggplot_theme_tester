## This script is a scalable version of brands_pal.R
## Credits to:
## https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2

source("scripts/create_named_chr.R")
palette_data <- readr::read_csv("palettes/palette-data.csv")

## Corporate colours
brands_colours <-
  create_named_chr(palette_data$colour,
                   palette_data$hex)

#' Function to extract Google colours as hex codes
#'
#' @param ... Character names of brands_colours
#'
brands_cols <- function(...) {
  
  cols <- c(...)
  
  if (is.null(cols))
    return(brands_colours)
  
  brands_colours[cols]
}

u_palette <-
  palette_data %>%
  pull(palette) %>%
  unique() 

## Combine colours into palettes
brands_palettes <-
  u_palette %>%
  map(function(x){
         chr_vect <-
           palette_data %>%
           filter(palette == x) %>%
           pull(colour)
         
         return(brands_cols(chr_vect))
       }) %>%
  set_names(u_palette)

#' Return function to interpolate a Google colour palette
#'
#' @param palette Character name of palette in brands_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to coloursRampPalette()

brands_pal <- function(palette = "msft", reverse = FALSE, ...) {
  pal <- brands_palettes[[palette]]
  
  if (reverse) pal <- rev(pal)
  
  grDevices::colorRampPalette(pal, ...)
}

#' Colour scale constructor for brands colours
#'
#' @param palette Character name of palette in brands_palettes
#' @param discrete Boolean indicating whether colours aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_colour_brands <- function(palette = "msft", discrete = TRUE, reverse = FALSE, ...) {
  pal <- brands_pal(palette = palette, reverse = reverse)
  
  if (discrete) {
    discrete_scale("colour", paste0("brands_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for brands colours
#'
#' @param palette Character name of palette in brands_palettes
#' @param discrete Boolean indicating whether colours aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_fill_brands <- function(palette = "msft", discrete = TRUE, reverse = FALSE, ...) {
  pal <- brands_pal(palette = palette, reverse = reverse)
  
  if (discrete) {
    discrete_scale("fill", paste0("brands_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}

#### Example ####
## Color by discrete variable using default palette
# ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
#   geom_point(size = 4) +
#   scale_colour_brands(palette = "msft")
# 
# ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
#   geom_point(size = 4) +
#   scale_colour_brands(palette = "google")
# 
# ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
#   geom_point(size = 4) +
#   scale_colour_brands(palette = "ig")

## Fill by discrete variable with different palette + remove legend (guide)
# ggplot(mpg, aes(manufacturer, fill = manufacturer)) +
#   geom_bar() +
#   theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
#   scale_fill_brands(palette = "msft", guide = "none")
# 
# ggplot(mpg, aes(manufacturer, fill = manufacturer)) +
#   geom_bar() +
#   theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
#   scale_fill_brands(palette = "ig", guide = "none")

