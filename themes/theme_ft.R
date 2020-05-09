theme_ft <- function(base_size = 12, font = "Segoe UI"){
  
  text_small_dark <- element_text(size = base_size - 2, colour = "grey20", face = "plain")
  text_small_light <- element_text(size = base_size - 2, colour = "#FFFFFF", face = "plain")
  text_normal <- element_text(size = base_size + 2, colour = "#FFFFFF", face = "plain")
  text_bold <- element_text(size = base_size + 2, colour = "#FFFFFF", face = "bold")
  text_title <- element_text(size = base_size + 8, colour = "#FFFFFF", face = "bold")
  
  theme_minimal(base_family = font) +
    theme(plot.background = element_rect(fill = "grey20"),
          text = text_normal,
          plot.title = text_title,
          
          axis.title = text_normal,
          axis.text = text_small_light,
          
          legend.title = text_small_light,
          legend.text = text_small_light) +
    
    theme(axis.line = element_line(colour = "#FFFFFF"),
          axis.ticks = element_blank(),
          
          legend.position = "top",
          legend.title = element_blank(),
          
          panel.grid = element_blank(),
          strip.background = element_rect(fill = "grey40", colour = "grey40"),
          strip.text = text_small_light)
}