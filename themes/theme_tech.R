theme_tech <- function(base_size = 12, font = "Roboto"){
  
  bg_colour <- "#263238"        # Dark blue-grey
  panel_colour <- "#37474f"     # Lighter blue-grey
  text_colour <- "#eceff1"      # Light grey
  accent_colour <- "#00e676"    # Bright green
  secondary_colour <- "#ff5722" # Deep orange
  
  text_small <- element_text(size = base_size - 2, colour = text_colour, face = "plain")
  text_normal <- element_text(size = base_size, colour = text_colour, face = "plain")
  text_bold <- element_text(size = base_size, colour = accent_colour, face = "bold")
  text_title <- element_text(size = base_size + 8, colour = text_colour, face = "bold")
  text_subtitle <- element_text(size = base_size + 2, colour = accent_colour, face = "plain")
  
  theme_minimal(base_family = font, base_size = base_size) +
    theme(
      # Background
      plot.background = element_rect(fill = bg_colour, colour = NA),
      panel.background = element_rect(fill = panel_colour, colour = NA),
      
      # Text
      text = text_normal,
      plot.title = text_title,
      plot.subtitle = text_subtitle,
      plot.caption = element_text(size = base_size - 3, colour = "grey70"),
      
      # Axes
      axis.title = text_bold,
      axis.text = text_small,
      axis.line = element_line(colour = accent_colour, linewidth = 0.5),
      axis.ticks = element_line(colour = accent_colour, linewidth = 0.3),
      
      # Legend
      legend.background = element_rect(fill = panel_colour, colour = NA),
      legend.title = text_bold,
      legend.text = text_small,
      legend.position = "bottom",
      legend.key = element_rect(fill = panel_colour, colour = NA),
      
      # Grid
      panel.grid.major = element_line(colour = "#455a64", linewidth = 0.3),
      panel.grid.minor = element_line(colour = "#455a64", linewidth = 0.15, linetype = "dotted"),
      
      # Strips
      strip.background = element_rect(fill = secondary_colour, colour = NA),
      strip.text = element_text(colour = "white", face = "bold", size = base_size),
      
      # Tech-style clean lines
      plot.margin = margin(t = 15, r = 15, b = 15, l = 15),
      panel.spacing = unit(1.5, "lines")
    )
}
