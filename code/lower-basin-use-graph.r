# Graph of water use in the Lower Colorado River Basin
# Data from the US Bureau of Reclamation
# Compilation by John Fleck, University of New Mexico Water Resources Program
# fleckj@unm.edu
library(ggplot2)
library(tidyverse)
library(readr)
library(reshape2)

lb <- read_csv("./data/lower-basin-use.csv", col_names=TRUE)

newdata <- as_tibble(melt(lb, id.vars="Year", 
                          variable.name="State", 
                          value.name="Use"))

ggplot(newdata, aes(x=Year, y=Use/1000000, colour=State)) +
  theme_bw() +
  theme(plot.title = element_text(size = rel(2)),
        panel.background = element_rect(colour = NA),
        plot.background = element_rect(colour = NA),
        plot.subtitle = element_text(size = rel(1.5)),
        axis.title = element_text(face = "bold",size = rel(1))) +
  geom_line(size=1) +
  ylab("millions of acre feet") +
  xlab("Data: USBR\nGraph:John Fleck, University of New Mexico Water Resources Program\n
       Code and data: https://github.com/johnrfleck/colorado-river") +
  ggtitle("Colorado River Lower Basin Water Use")
