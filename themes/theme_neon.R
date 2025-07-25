theme_neon <- function(base_size = 12, font = "Arial"){
  
  bg_colour <- "#0a0a0a"        # Almost black
  panel_colour <- "#1a0a1a"     # Dark purple
  text_colour <- "#00ff41"      # Neon green
  accent_colour <- "#ff0080"    # Neon pink
  secondary_colour <- "#00ffff" # Cyan
  
  text_small <- element_text(size = base_size - 2, colour = text_colour, face = "plain")
  text_normal <- element_text(size = base_size, colour = text_colour, face = "plain")
  text_bold <- element_text(size = base_size, colour = secondary_colour, face = "bold")
  text_title <- element_text(size = base_size + 8, colour = accent_colour, face = "bold")
  text_subtitle <- element_text(size = base_size + 2, colour = secondary_colour, face = "italic")
  
  theme_minimal(base_family = font, base_size = base_size) +
    theme(
      # Background
      plot.background = element_rect(fill = bg_colour, colour = NA),
      panel.background = element_rect(fill = panel_colour, colour = NA),
      
      # Text
      text = text_normal,
      plot.title = text_title,
      plot.subtitle = text_subtitle,
      plot.caption = element_text(size = base_size - 3, colour = "#666666"),
      
      # Axes
      axis.title = text_bold,
      axis.text = text_small,
      axis.line = element_line(colour = text_colour, linewidth = 1),
      axis.ticks = element_line(colour = text_colour, linewidth = 0.5),
      
      # Legend
      legend.background = element_rect(fill = panel_colour, colour = text_colour, linewidth = 0.5),
      legend.title = text_bold,
      legend.text = text_small,
      legend.position = "right",
      legend.key = element_rect(fill = panel_colour, colour = NA),
      
      # Grid
      panel.grid.major = element_line(colour = "#003300", linewidth = 0.5),
      panel.grid.minor = element_line(colour = "#001100", linewidth = 0.25),
      
      # Strips
      strip.background = element_rect(fill = accent_colour, colour = text_colour, linewidth = 0.5),
      strip.text = element_text(colour = bg_colour, face = "bold", size = base_size),
      
      # Add glow effect simulation
      panel.border = element_rect(colour = text_colour, fill = NA, linewidth = 0.5)
    )
}
