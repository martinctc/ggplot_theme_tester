#### Create base plots ####

cleaned_airquality <-
  airquality %>%
  as_tibble() %>%
  mutate(Date = paste("1973", Month, Day, sep = "/")) %>%
  mutate_at(vars(Date), ~lubridate::ymd(.))
  

## line plot
line_plot <-
  cleaned_airquality %>%
  select(-Month, -Day) %>%
  gather(Metrics, Value, -Date) %>%
  ggplot(aes(x = Date, y = Value), colour = "steelblue") +
  geom_line() + 
  facet_grid(Metrics ~ .) +
  labs(x = "Months in 1973",
       y = "Measurement Value",
       title = "Air Quality Dataset - Line plot")


## scatter plot with lm
point_plot_lm <- 
  airquality %>%
  tidyr::drop_na() %>%
  mutate(Month = month.abb[Month]) %>%
  mutate(Month = factor(Month, levels = month.abb[5:9])) %>%
  ggplot(aes(Ozone, Temp)) +
  geom_point(color = "steelblue", size = 3, alpha = 0.5) +
  facet_grid(. ~ Month) + 
  geom_smooth(method = "lm", formula = "y ~ x") +
  labs(x = "Ozone",
       y = "Temperature",
       title = "Air Quality Dataset\nScatter plot with linear regression")


## line plot with loess curve fitting
point_plot_loess <-
  airquality %>%
  ggplot(aes(Temp, Ozone)) + 
  geom_point() + 
  geom_smooth(method = "loess", se = FALSE) +
  labs(x = "Temperature",
       y = "Ozone",
       title = "Air Quality Dataset\nScatter plot with Loess curve")
  
## faceted scatterplot
faceted_scatterplot <-
  cleaned_airquality %>%
  select(-Month, -Day) %>%
  gather(Metrics, Value, -Date) %>%
  tidyr::drop_na() %>%
  ggplot(aes(Date, Value)) +
  geom_point() + 
  facet_wrap(~Metrics) +
  labs(x = "Date",
       y = "Measurement Value",
       title = "Air Quality Dataset\nFaceted scatter plot")


## Put everything together
base_plots <-
  list(line_plot,
       point_plot_lm,
       point_plot_loess,
       faceted_scatterplot)