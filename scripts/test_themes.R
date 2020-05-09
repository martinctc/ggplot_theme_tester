#' @title Function to be used with `map()` to apply themes to plots
#' 
#' @param plot A ggplot object
#' @param theme A function that stores a ggplot theme to be applied
#' @param theme_label A label to be populated in the subtitles of the plots
#' 
test_theme <- function(plot,
                       theme,
                       theme_label){
  plot +
    theme +
    labs(subtitle = theme_label)
  
}

#' @title A wrapper around `test_theme()`
#'
#' @param plots A list of ggplot objects 
#' @param themes A function that stores a ggplot theme to be applied
#' @param theme_labels A label to be populated in the subtitles of the plots
run_themes <- function(plots,
                       themes,
                       theme_labels){
  plots %>%
    purrr::map(~test_theme(plot = .,
                           theme = themes,
                           theme_label = theme_labels)) %>%
    purrr::reduce(`+`)
  
}


#' @title A wrapper around `test_theme()`, with a palette argument
#' @description 
#' Based off `create_baseplots()`
#'
#' @param palette A character vector to be applied to `create_baseplots()`
#' @param themes A function that stores a ggplot theme to be applied
#' @param theme_labels A label to be populated in the subtitles of the plots
run_themes_withpal <- function(palette,
                               themes,
                               theme_labels){
  
  plots <- create_baseplots(palette = palette)
  
  plots %>%
    purrr::map(~test_theme(plot = .,
                           theme = themes,
                           theme_label = theme_labels)) %>%
    purrr::reduce(`+`)
  
}
