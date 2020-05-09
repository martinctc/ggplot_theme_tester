# ggplot theme tester

This is a project to create a workflow for designing and testing custom ggplot themes. 

### Pre-requisites

- {tidyverse} (essential) 
- {patchwork} (essential)
- RStudio (recommended)
- {extrafont} (recommended)

{extrafont} enables you to use a much wider range of fonts in your ggplots. If you have never initialised {extrafont} before, I recommend you to run the following lines of code. You'll only need to do this once:
```r
install.packages("extrafont")

extrafont::font_import()
loadfonts(device = "win")
```
This can take around 5 minutes. After the process is completed, you will just need to load the {extrafont} library with `library(extrafont)` to use the desired fonts in ggplot. 

### Workflow Basics

You can get started by cloning this repository, using GitHub Desktop or cloning it the traditional way using git.

1. Load {tidyverse} and {extrafont} to ensure all ggplot2 features and fonts are available in the design and testing process.

2. Use `source()` to load in the pre-built ggplot objects from the `base_plots` folder. These are basically simple plots created with {ggplot2} to be used for designing and testing the themes you are creating. You can create more complicated base ggplots for testing if you prefer.

3. Create your ggplot theme as a function, and save the R file under "themes". In the main script, use `source()` again to load in the theme you've created. 

4. Run the test function to iterate through how your theme would look like with different base plot configurations. In this workflow, I use {patchwork} to combine the plots for easy viewing.
