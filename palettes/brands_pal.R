## Credits to:
## https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2

## Corporate colours
brands_colours <-
  c(`google-blue` = "#4285F4",
    `google-red` = "#DB4437",
    `google-yellow` = "#F4B400",
    `google-green` = "#F4B400",
    `msft-orange` = "#F25022",
    `msft-green` = "#7FBA00",
    `msft-blue` = "#00A4EF",
    `msft-yellow` = "#FFB900",
    `msft-grey` = "#737373",
    `ig-blue` = "#405DE6",
    `ig-purpleblue` = "#5851DB",
    `ig-purple` = "#833AB4",
    `ig-purplered` = "#C13584",
    `ig-rose` = "#E1306C",
    `ig-red` = "#FD1D1D",
    `ig-redorange` = "#F56040",
    `ig-orange` = "#F77737",
    `ig-orangeyellow` = "#FCAF45",
    `ig-yellow` = "#FFDC80")

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


## Combine colourss into palettes
brands_palettes <-
  list(`google` = brands_cols("google-blue",
                              "google-red",
                              "google-green",
                              "google-yellow"),
       `msft` = brands_cols("msft-orange",
                            "msft-green",
                            "msft-blue",
                            "msft-yellow",
                            "msft-grey"),
       `ig` = brands_cols("ig-blue",
                          "ig-purpleblue",
                          "ig-purple",
                          "ig-purplered",
                          "ig-rose",
                          "ig-red",
                          "ig-redorange",
                          "ig-orange",
                          "ig-orangeyellow",
                          "ig-yellow"))

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

