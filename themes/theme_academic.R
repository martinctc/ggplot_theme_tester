theme_academic <- function(base_size = 12, font = "Times New Roman"){
  
  bg_colour <- "#ffffff"        # Pure white
  text_colour <- "#000000"      # Pure black
  grid_colour <- "#d0d0d0"      # Light grey
  accent_colour <- "#2c5aa0"    # Academic blue
  
  text_small <- element_text(size = base_size - 2, colour = text_colour, face = "plain")
  text_normal <- element_text(size = base_size, colour = text_colour, face = "plain")
  text_bold <- element_text(size = base_size, colour = text_colour, face = "bold")
  text_title <- element_text(size = base_size + 4, colour = text_colour, face = "bold")
  text_subtitle <- element_text(size = base_size + 1, colour = text_colour, face = "italic")
  
  theme_minimal(base_family = font, base_size = base_size) +
    theme(
      # Background
      plot.background = element_rect(fill = bg_colour, colour = NA),
      panel.background = element_rect(fill = bg_colour, colour = NA),
      
      # Text
      text = text_normal,
      plot.title = text_title,
      plot.subtitle = text_subtitle,
      plot.caption = element_text(size = base_size - 3, colour = "grey30", face = "italic"),
      
      # Axes
      axis.title = text_normal,
      axis.text = text_small,
      axis.line = element_line(colour = text_colour, linewidth = 0.5),
      axis.ticks = element_line(colour = text_colour, linewidth = 0.3),
      
      # Legend
      legend.background = element_rect(fill = bg_colour, colour = "grey80", linewidth = 0.5),
      legend.title = text_bold,
      legend.text = text_small,
      legend.position = "bottom",
      legend.key = element_rect(fill = bg_colour, colour = NA),
      legend.margin = margin(t = 10, b = 5),
      
      # Grid
      panel.grid.major = element_line(colour = grid_colour, linewidth = 0.3),
      panel.grid.minor = element_line(colour = grid_colour, linewidth = 0.15),
      
      # Strips
      strip.background = element_rect(fill = "grey90", colour = "grey70", linewidth = 0.5),
      strip.text = element_text(colour = text_colour, face = "bold", size = base_size - 1),
      
      # Plot margins
      plot.margin = margin(t = 20, r = 20, b = 20, l = 20)
    )
}
