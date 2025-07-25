theme_corporate <- function(base_size = 12, font = "Segoe UI"){
  
  bg_colour <- "#fafafa"        # Very light grey
  panel_colour <- "#ffffff"     # Pure white
  text_colour <- "#2c3e50"      # Dark blue-grey
  accent_colour <- "#3498db"    # Professional blue
  grid_colour <- "#ecf0f1"      # Light grey
  
  text_small <- element_text(size = base_size - 2, colour = text_colour, face = "plain")
  text_normal <- element_text(size = base_size, colour = text_colour, face = "plain")
  text_bold <- element_text(size = base_size, colour = text_colour, face = "bold")
  text_title <- element_text(size = base_size + 8, colour = text_colour, face = "bold")
  text_subtitle <- element_text(size = base_size + 2, colour = "grey40", face = "plain")
  
  theme_minimal(base_family = font, base_size = base_size) +
    theme(
      # Background
      plot.background = element_rect(fill = bg_colour, colour = NA),
      panel.background = element_rect(fill = panel_colour, colour = NA),
      
      # Text
      text = text_normal,
      plot.title = text_title,
      plot.subtitle = text_subtitle,
      plot.caption = element_text(size = base_size - 3, colour = "grey50"),
      
      # Axes
      axis.title = text_bold,
      axis.text = text_small,
      axis.line = element_line(colour = "grey30", linewidth = 0.5),
      axis.ticks = element_line(colour = "grey30", linewidth = 0.3),
      
      # Legend
      legend.background = element_rect(fill = panel_colour, colour = NA),
      legend.title = text_bold,
      legend.text = text_small,
      legend.position = "bottom",
      legend.key = element_rect(fill = panel_colour, colour = NA),
      legend.spacing = unit(0.5, "cm"),
      
      # Grid
      panel.grid.major = element_line(colour = grid_colour, linewidth = 0.5),
      panel.grid.minor = element_blank(),
      
      # Strips
      strip.background = element_rect(fill = accent_colour, colour = NA),
      strip.text = element_text(colour = "white", face = "bold", size = base_size),
      
      # Professional spacing
      plot.margin = margin(t = 20, r = 20, b = 20, l = 20),
      panel.spacing = unit(1, "lines")
    )
}
