theme_vintage <- function(base_size = 12, font = "Times New Roman"){
  
  bg_colour <- "#f7f3e7"        # Vintage paper
  panel_colour <- "#faf7f0"     # Cream
  text_colour <- "#5d4037"      # Dark brown
  accent_colour <- "#8d6e63"    # Medium brown
  grid_colour <- "#d7ccc8"      # Light brown
  
  text_small <- element_text(size = base_size - 2, colour = text_colour, face = "plain")
  text_normal <- element_text(size = base_size, colour = text_colour, face = "plain")
  text_bold <- element_text(size = base_size, colour = text_colour, face = "bold")
  text_title <- element_text(size = base_size + 8, colour = text_colour, face = "bold")
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
      plot.caption = element_text(size = base_size - 3, colour = "grey60", face = "italic"),
      
      # Axes
      axis.title = text_bold,
      axis.text = text_small,
      axis.line = element_line(colour = text_colour, linewidth = 0.8),
      axis.ticks = element_line(colour = text_colour, linewidth = 0.5),
      
      # Legend
      legend.background = element_rect(fill = panel_colour, colour = text_colour, linewidth = 0.5),
      legend.title = text_bold,
      legend.text = text_small,
      legend.position = "top",
      legend.key = element_rect(fill = panel_colour, colour = NA),
      legend.margin = margin(b = 10),
      
      # Grid
      panel.grid.major = element_line(colour = grid_colour, linewidth = 0.6, linetype = "dotted"),
      panel.grid.minor = element_blank(),
      
      # Strips
      strip.background = element_rect(fill = accent_colour, colour = text_colour, linewidth = 0.5),
      strip.text = element_text(colour = panel_colour, face = "bold", size = base_size - 1),
      
      # Vintage feel with borders
      panel.border = element_rect(colour = text_colour, fill = NA, linewidth = 0.5),
      plot.margin = margin(t = 20, r = 20, b = 20, l = 20)
    )
}
