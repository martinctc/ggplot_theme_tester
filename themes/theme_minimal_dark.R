theme_minimal_dark <- function(base_size = 12, font = "Segoe UI"){
  
  bg_colour <- "#1a1a1a"        # Very dark grey
  panel_colour <- "#2d2d2d"     # Slightly lighter grey
  text_colour <- "#e0e0e0"      # Light grey text
  accent_colour <- "#4a9eff"    # Blue accent
  
  text_small <- element_text(size = base_size - 2, colour = text_colour, face = "plain")
  text_normal <- element_text(size = base_size, colour = text_colour, face = "plain")
  text_bold <- element_text(size = base_size, colour = text_colour, face = "bold")
  text_title <- element_text(size = base_size + 6, colour = "#ffffff", face = "bold")
  text_subtitle <- element_text(size = base_size + 2, colour = text_colour, face = "plain")
  
  theme_minimal(base_family = font, base_size = base_size) +
    theme(
      # Background
      plot.background = element_rect(fill = bg_colour, colour = NA),
      panel.background = element_rect(fill = panel_colour, colour = NA),
      
      # Text
      text = text_normal,
      plot.title = text_title,
      plot.subtitle = text_subtitle,
      plot.caption = element_text(size = base_size - 3, colour = "grey60"),
      
      # Axes
      axis.title = text_normal,
      axis.text = text_small,
      axis.line = element_line(colour = "grey50", linewidth = 0.5),
      axis.ticks = element_line(colour = "grey50", linewidth = 0.3),
      
      # Legend
      legend.background = element_rect(fill = panel_colour, colour = NA),
      legend.title = text_small,
      legend.text = text_small,
      legend.position = "bottom",
      legend.key = element_rect(fill = panel_colour, colour = NA),
      
      # Grid
      panel.grid.major = element_line(colour = "grey40", linewidth = 0.2),
      panel.grid.minor = element_blank(),
      
      # Strips
      strip.background = element_rect(fill = accent_colour, colour = NA),
      strip.text = element_text(colour = "white", face = "bold", size = base_size - 1)
    )
}
