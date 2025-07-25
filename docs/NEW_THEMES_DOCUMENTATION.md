# New ggplot2 Themes Documentation

This document describes the 8 new themes added to the ggplot theme tester repository.

## Quick Reference Table

| Theme | Style | Best For | Example Script |
|-------|-------|----------|----------------|
| `theme_minimal_dark()` | Clean, modern dark | Dashboards, presentations | `example-script_minimal_dark.R` |
| `theme_retro()` | 80s/90s cyberpunk | Creative projects, gaming | `example-script_retro.R` |
| `theme_academic()` | Professional publication | Research papers, reports | `example-script_academic.R` |
| `theme_neon()` | Cyberpunk bright | Tech presentations, gaming | `example-script_neon.R` |
| `theme_nature()` | Earth tones, organic | Environmental data | `example-script_nature.R` |
| `theme_corporate()` | Modern business | Corporate presentations | `example-script_corporate.R` |
| `theme_vintage()` | Classic newspaper | Historical data, retro | `example-script_vintage.R` |
| `theme_tech()` | Modern tech company | Startup presentations | `example-script_tech.R` |

## Theme Overview

### 1. Minimal Dark (`theme_minimal_dark()`)
- **Style**: Clean, modern dark theme
- **Colors**: Dark grey background with light text
- **Font**: Segoe UI (default)
- **Best for**: Dashboards, presentations, modern applications
- **Features**: Blue accent colors, minimal grid lines, excellent readability

### 2. Retro (`theme_retro()`)
- **Style**: 80s/90s cyberpunk inspired
- **Colors**: Dark navy background with bright neon colors
- **Font**: Courier New (monospace)
- **Best for**: Creative projects, gaming-related visualizations, tech demos
- **Features**: Hot pink titles, yellow text, dotted grid lines, retro aesthetics

### 3. Academic (`theme_academic()`)
- **Style**: Professional academic publication style
- **Colors**: White background with black text
- **Font**: Times New Roman
- **Best for**: Research papers, scientific publications, formal reports
- **Features**: Conservative design, subtle grid lines, professional margins

### 4. Neon (`theme_neon()`)
- **Style**: Cyberpunk with bright accent colors
- **Colors**: Almost black background with neon green and pink
- **Font**: Arial
- **Best for**: Tech presentations, gaming interfaces, futuristic themes
- **Features**: Glowing effect simulation, bright contrasts, sci-fi aesthetics

### 5. Nature (`theme_nature()`)
- **Style**: Earth tones and organic feeling
- **Colors**: Beige/cream background with forest green and brown
- **Font**: Georgia
- **Best for**: Environmental data, organic/natural topics, outdoors content
- **Features**: Warm earth tones, dotted minor grid lines, natural palette

### 6. Corporate (`theme_corporate()`)
- **Style**: Modern business presentation style
- **Colors**: Light grey background with professional blue accents
- **Font**: Segoe UI
- **Best for**: Business reports, corporate presentations, professional dashboards
- **Features**: Clean lines, professional spacing, business-appropriate colors

### 7. Vintage (`theme_vintage()`)
- **Style**: Classic newspaper/magazine design
- **Colors**: Vintage paper background with brown text
- **Font**: Times New Roman
- **Best for**: Historical data, classic publications, retro designs
- **Features**: Paper-like background, dotted grid lines, vintage typography, borders

### 8. Tech (`theme_tech()`)
- **Style**: Modern technology company design
- **Colors**: Dark blue-grey with bright green accents
- **Font**: Roboto
- **Best for**: Tech company reports, modern interfaces, startup presentations
- **Features**: Clean tech aesthetics, bright accent colors, modern spacing

## Usage Examples

### Basic Usage
```r
library(tidyverse)
library(patchwork)

# Load your base plots
source("base_plots/base_plots.R")

# Load a theme
source("themes/theme_corporate.R")

# Apply to a plot
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  theme_corporate() +
  labs(title = "Car Weight vs MPG", 
       subtitle = "Using Corporate Theme")
```

### Testing Multiple Themes
```r
# Load all themes
source("themes/theme_minimal_dark.R")
source("themes/theme_retro.R")
# ... etc

# Test function
test_themes <- function(plots, theme, theme_label){
  plots + theme + labs(subtitle = theme_label)
}

# Apply to base plots
base_plots %>%
  map(test_themes,
      theme = theme_minimal_dark(),
      theme_label = "Minimal Dark Theme") %>%
  reduce(`+`)
```

### Comparing All New Themes
Use the `example-script_all_new_themes.R` script to see all themes applied to the same plot for easy comparison.

### Testing Individual Themes
Each theme has its own example script for focused testing:

- **Minimal Dark**: `example-script_minimal_dark.R`
- **Retro**: `example-script_retro.R`
- **Academic**: `example-script_academic.R`
- **Neon**: `example-script_neon.R`
- **Nature**: `example-script_nature.R`
- **Corporate**: `example-script_corporate.R`
- **Vintage**: `example-script_vintage.R`
- **Tech**: `example-script_tech.R`

Simply run any of these scripts to see how the respective theme looks across all your base plots.

## Customization

Each theme accepts standard parameters:
- `base_size`: Base font size (default: 12)
- `font`: Font family (varies by theme)

Example:
```r
theme_corporate(base_size = 14, font = "Arial")
```

## Color Palettes

Each theme is designed with a specific color palette:

- **Minimal Dark**: Blues and greys
- **Retro**: Neon pinks, yellows, and cyans
- **Academic**: Black and white with subtle greys
- **Neon**: Bright greens and magentas
- **Nature**: Earth tones (browns, greens, beiges)
- **Corporate**: Professional blues and greys
- **Vintage**: Warm browns and paper tones
- **Tech**: Modern blue-greys with green accents

## File Structure

```
themes/
├── theme_minimal_dark.R
├── theme_retro.R
├── theme_academic.R
├── theme_neon.R
├── theme_nature.R
├── theme_corporate.R
├── theme_vintage.R
└── theme_tech.R

scripts/
├── example-script_minimal_dark.R
├── example-script_retro.R
├── example-script_academic.R
├── example-script_neon.R
├── example-script_nature.R
├── example-script_corporate.R
├── example-script_vintage.R
├── example-script_tech.R
└── example-script_all_new_themes.R
```
