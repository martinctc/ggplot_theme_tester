## Credits to:
## https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2
## Google corporate colours
google_colours <-
  c(`blue` = "#4285F4",
    `red` = "#DB4437",
    `yellow` = "#F4B400",
    `green` = "#F4B400")

#' Function to extract Google colours as hex codes
#'
#' @param ... Character names of google_colours
#'
google_cols <- function(...) {
  
  cols <- c(...)
  
  if (is.null(cols))
    return(google_colours)
  
  google_colours[cols]
}


## Combine colourss into palettes
google_palettes <-
  list(`main` = google_cols("blue", "red", "green", "yellow"))

#' Return function to interpolate a Google colour palette
#'
#' @param palette Character name of palette in google_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to coloursRampPalette()
#'
google_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- google_palettes[[palette]]
  
  if (reverse) pal <- rev(pal)
  
  grDevices::colorRampPalette(pal, ...)
}

#' Colour scale constructor for google colours
#'
#' @param palette Character name of palette in google_palettes
#' @param discrete Boolean indicating whether colours aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_colour_google <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- google_pal(palette = palette, reverse = reverse)
  
  if (discrete) {
    discrete_scale("colour", paste0("google_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for google colours
#'
#' @param palette Character name of palette in google_palettes
#' @param discrete Boolean indicating whether colours aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_fill_google <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- google_pal(palette = palette, reverse = reverse)
  
  if (discrete) {
    discrete_scale("fill", paste0("google_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}

## Example
# Color by discrete variable using default palette
ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
  geom_point(size = 4) +
  scale_colour_google()

# Fill by discrete variable with different palette + remove legend (guide)
ggplot(mpg, aes(manufacturer, fill = manufacturer)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_google(palette = "main", guide = "none")
