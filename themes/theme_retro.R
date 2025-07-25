theme_retro <- function(base_size = 12, font = "Courier New"){
  
  bg_colour <- "#0f0f23"        # Dark navy
  panel_colour <- "#1a1a3a"     # Slightly lighter navy
  text_colour <- "#cccc6f"      # Retro yellow
  accent_colour <- "#ff6ec7"    # Hot pink
  grid_colour <- "#332266"      # Purple grid
  
  text_small <- element_text(size = base_size - 2, colour = text_colour, face = "plain")
  text_normal <- element_text(size = base_size, colour = text_colour, face = "plain")
  text_bold <- element_text(size = base_size, colour = accent_colour, face = "bold")
  text_title <- element_text(size = base_size + 8, colour = "#ff6ec7", face = "bold")
  text_subtitle <- element_text(size = base_size + 2, colour = "#66ffcc", face = "italic")
  
  theme_minimal(base_family = font, base_size = base_size) +
    theme(
      # Background
      plot.background = element_rect(fill = bg_colour, colour = NA),
      panel.background = element_rect(fill = panel_colour, colour = NA),
      
      # Text
      text = text_normal,
      plot.title = text_title,
      plot.subtitle = text_subtitle,
      plot.caption = element_text(size = base_size - 3, colour = "#9999ff"),
      
      # Axes
      axis.title = text_bold,
      axis.text = text_small,
      axis.line = element_line(colour = accent_colour, linewidth = 0.8),
      axis.ticks = element_line(colour = accent_colour, linewidth = 0.5),
      
      # Legend
      legend.background = element_rect(fill = panel_colour, colour = accent_colour, linewidth = 0.5),
      legend.title = text_bold,
      legend.text = text_small,
      legend.position = "top",
      legend.key = element_rect(fill = panel_colour, colour = NA),
      
      # Grid
      panel.grid.major = element_line(colour = grid_colour, linewidth = 0.3, linetype = "dotted"),
      panel.grid.minor = element_blank(),
      
      # Strips
      strip.background = element_rect(fill = accent_colour, colour = NA),
      strip.text = element_text(colour = bg_colour, face = "bold", size = base_size)
    )
}
