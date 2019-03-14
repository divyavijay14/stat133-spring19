# title: Make Shot Charts
# description: This R Script file will create shot charts based on the data in shots_data.
# input(s): The shots_data dataset and all the individual players' dataframes.
# output(s): This file will output multiple shot charts.

library(ggplot2)
library(jpeg)
library(grid)

#example
klay_scatterplot <- ggplot(data = thompson) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))

klay_scatterplot

court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

#example (cont.)
klay_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
klay_shot_chart

# stephen curry shot chart
stephen_curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Steph Curry (2016 season)') +
  theme_minimal()
ggsave('../images/stephen-curry-shot-chart.pdf', plot = stephen_curry_shot_chart)

  # draymond green shot chart

draymond_green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()
ggsave('../images/draymond-green-shot-chart.pdf', plot = draymond_green_shot_chart)

# kevin durant shot chart
kevin_durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
ggsave('../images/kevin-durant-shot-chart.pdf', plot = kevin_durant_shot_chart)

# klay thompson shot chart

klay_thompson_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
ggsave('../images/klay-thompson-shot-chart.pdf', plot = klay_thompson_shot_chart)


# andre iguodala shot chart

andre_iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
ggsave('../images/andre-iguodala-shot-chart.pdf', plot = andre_iguodala_shot_chart)



gsw_shot_charts <- ggplot(data = shots_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  facet_wrap('name') +
  ylim(-50, 420) +
  ggtitle('GSW Shot Charts (2016 Season)' +
            theme_minimal())

gsw_shot_charts
ggsave('../images/gsw-shot-charts.pdf', plot = gsw_shot_charts)
ggsave('../images/gsw-shot-charts.png', plot = gsw_shot_charts)



