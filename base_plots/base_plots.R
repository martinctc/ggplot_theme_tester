#### Create base plots ####
## scatter plot
point_plot <-
  ggplot(iris, aes(x=jitter(Sepal.Width),
                   y=jitter(Sepal.Length),
                   col=Species)) +
  geom_point() +
  labs(x="Sepal Width (cm)",
       y="Sepal Length (cm)",
       col="Species",
       title="Iris Dataset - Scatter plot")

## bar plot
bar_plot <-
  iris %>%
  group_by(Species) %>%
  summarise(Sepal.Width = mean(Sepal.Width)) %>%
  ggplot(aes(x=Species, y=Sepal.Width, fill=Species)) +
  geom_col() +
  labs(x="Species",
       y="Mean Sepal Width (cm)",
       fill="Species",
       title="Iris Dataset - Bar plot")

## box plot
box_plot <- ggplot(iris,
                   aes(x=Species,
                       y=Sepal.Width,
                       fill=Species)) +
  geom_boxplot() +
  labs(x="Species",
       y="Sepal Width (cm)",
       fill="Species",
       title="Iris Dataset - Box plot")

## density plot
density_plot <-
  iris %>%
  ggplot(aes(x = Sepal.Length, fill = Species)) +
  geom_density(linewidth = 0.1, alpha = 0.8) +
  facet_wrap(.~Species) +
  labs(x="Sepal Length (cm)",
       y="Density",
       fill="Species",
       title="Iris Dataset - Density plot")


base_plots <-
  list(bar_plot,
       box_plot,
       density_plot,
       point_plot)