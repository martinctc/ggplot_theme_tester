theme_nature <- function(base_size = 12, font = "Georgia"){
  
  bg_colour <- "#f5f5dc"        # Beige
  panel_colour <- "#faf8f3"     # Cream
  text_colour <- "#2d4a2b"      # Forest green
  accent_colour <- "#8b4513"    # Saddle brown
  grid_colour <- "#d2b48c"      # Tan
  
  text_small <- element_text(size = base_size - 2, colour = text_colour, face = "plain")
  text_normal <- element_text(size = base_size, colour = text_colour, face = "plain")
  text_bold <- element_text(size = base_size, colour = accent_colour, face = "bold")
  text_title <- element_text(size = base_size + 6, colour = text_colour, face = "bold")
  text_subtitle <- element_text(size = base_size + 2, colour = accent_colour, face = "italic")
  
  theme_minimal(base_family = font, base_size = base_size) +
    theme(
      # Background
      plot.background = element_rect(fill = bg_colour, colour = NA),
      panel.background = element_rect(fill = panel_colour, colour = NA),
      
      # Text
      text = text_normal,
      plot.title = text_title,
      plot.subtitle = text_subtitle,
      plot.caption = element_text(size = base_size - 3, colour = "grey50", face = "italic"),
      
      # Axes
      axis.title = text_bold,
      axis.text = text_small,
      axis.line = element_line(colour = accent_colour, linewidth = 0.7),
      axis.ticks = element_line(colour = accent_colour, linewidth = 0.4),
      
      # Legend
      legend.background = element_rect(fill = panel_colour, colour = grid_colour, linewidth = 0.5),
      legend.title = text_bold,
      legend.text = text_small,
      legend.position = "bottom",
      legend.key = element_rect(fill = panel_colour, colour = NA),
      
      # Grid
      panel.grid.major = element_line(colour = grid_colour, linewidth = 0.4),
      panel.grid.minor = element_line(colour = grid_colour, linewidth = 0.2, linetype = "dotted"),
      
      # Strips
      strip.background = element_rect(fill = "#deb887", colour = accent_colour, linewidth = 0.5),
      strip.text = element_text(colour = text_colour, face = "bold", size = base_size - 1),
      
      # Add natural texture feel
      plot.margin = margin(t = 15, r = 15, b = 15, l = 15)
    )
}
