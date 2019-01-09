# mead-powell storage graph
library(ggplot2)
library(tidyverse)
library(readr)

# read data
mp <- read_csv("./data/meadpowell.csv", col_names=TRUE)

# add up total storage
mp$Storage <- mp$Mead + mp$Powell

# plot it
ggplot(mp, aes(x=Year, y=Storage/1000)) +
  theme_bw() +
  theme(plot.title = element_text(size = rel(2)),
        panel.background = element_rect(colour = NA),
        plot.background = element_rect(colour = NA),
        plot.subtitle = element_text(size = rel(1.5)),
        axis.title = element_text(face = "bold",size = rel(1))) +
  geom_line(size=1.5) +
  ylab("millions of acre feet") +
  xlab("year") +
  ggtitle("Combined Storage, Lakes Mead and Powell")

