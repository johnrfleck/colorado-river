# Graph of water use in the Lower Colorado River Basin
# Data from the US Bureau of Reclamation
# Compilation by John Fleck, Utton Center, University of New Mexico School of Law
library(ggplot2)
library(tidyverse)
library(readr)

lb <- read_csv("./data/lower-basin-use.csv", col_names=TRUE)

newdata <- lb %>%
  pivot_longer(cols = -Year, names_to = "State", values_to = "Use") %>%
  bind_rows(
    lb %>%
      pivot_longer(cols = -Year, names_to = "State", values_to = "Use") %>%
      group_by(Year) %>%
      summarize(Use = sum(Use), .groups = "drop") %>%
      mutate(State = "Total US Lower Basin")
  ) %>%
  mutate(State = factor(State, levels = c("California", "Arizona", "Nevada", "Total US Lower Basin")))

p <- ggplot(newdata, aes(x=Year, y=Use/1000000)) +
  theme_bw() +
  theme(plot.title = element_text(size = rel(2)),
        panel.background = element_rect(colour = NA),
        plot.background = element_rect(colour = NA),
        plot.subtitle = element_text(size = rel(1.5)),
        axis.title = element_text(face = "bold",size = rel(1))) +
  geom_line(linewidth=1, color="steelblue") +
  facet_wrap(~State, nrow = 2, scales = "free_y") +
  expand_limits(y = 0) +
  ylab("millions of acre feet") +
  xlab("Data: USBR\nGraph:John Fleck, Utton Center, University of New Mexico School of Law\n
       Code and data: https://github.com/johnrfleck/colorado-river") +
  ggtitle("Colorado River Lower Basin Water Use")

print(p)
