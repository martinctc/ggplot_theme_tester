theme_ft <- function(base_size = 12, font = "Georgia"){
  
  bg_colour <- "#F2DFCE"
  bg_colour2 <- "#FFF1E5"
  text_colour <- "black"
  
  text_small_dark <- element_text(size = base_size - 2, colour = text_colour, face = "plain")
  text_small_light <- element_text(size = base_size - 2, colour = "#FFFFFF", face = "plain")
  text_normal <- element_text(size = base_size + 2, colour = text_colour, face = "plain")
  text_bold <- element_text(size = base_size + 2, colour = text_colour, face = "bold")
  text_title <- element_text(size = base_size + 8, colour = text_colour, face = "bold")
  
  theme_minimal(base_family = font) +
    theme(plot.background = element_rect(fill = bg_colour),
          text = text_normal,
          plot.title = text_title,
          
          axis.title = text_normal,
          axis.text = text_small_dark,
          
          legend.title = text_small_dark,
          legend.text = text_small_dark) +
    
    theme(axis.line = element_line(colour = "grey20"),
          axis.ticks = element_blank(),
          
          legend.position = "top",
          legend.title = element_blank(),
          
          panel.grid = element_blank(),
          strip.background = element_rect(fill = bg_colour2, colour = bg_colour2),
          strip.text = text_small_dark)
}
