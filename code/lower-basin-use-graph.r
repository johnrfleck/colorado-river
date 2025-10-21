# Graph of water use in the Lower Colorado River Basin
# Data from the US Bureau of Reclamation
# Compilation by John Fleck, Utton Center, University of New Mexico School of Law
library(ggplot2)
library(tidyverse)
library(readr)

lb <- read_csv("./data/lower-basin-use.csv", col_names=TRUE)

newdata <- lb %>%
  pivot_longer(cols = -Year, names_to = "State", values_to = "Use")

p <- ggplot(newdata, aes(x=Year, y=Use/1000000, colour=State)) +
  theme_bw() +
  theme(plot.title = element_text(size = rel(2)),
        panel.background = element_rect(colour = NA),
        plot.background = element_rect(colour = NA),
        plot.subtitle = element_text(size = rel(1.5)),
        axis.title = element_text(face = "bold",size = rel(1))) +
  geom_line(linewidth=1) +
  ylab("millions of acre feet") +
  xlab("Data: USBR\nGraph:John Fleck, Utton Center, University of New Mexico School of Law\n
       Code and data: https://github.com/johnrfleck/colorado-river") +
  ggtitle("Colorado River Lower Basin Water Use")

print(p)
