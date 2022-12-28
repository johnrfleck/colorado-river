# mead-powell storage graph
# revised December 2022 to pull data directly from USBR
library(ggplot2)
library(tidyverse)
library(readr)


# read data from USBR web site


mead <- read_csv("https://www.usbr.gov/uc/water/hydrodata/reservoir_data/921/csv/17.csv")
powell <- read_csv("https://www.usbr.gov/uc/water/hydrodata/reservoir_data/919/csv/17.csv")

# merge the two datasets
mp <- full_join(mead, powell, by = "datetime")

#rename columns
mp <- mp %>%
  rename(Mead = storage.x) %>%
  rename(Powell = storage.y)

# replace NA's in Powell column with zeros
# I have no idea how this works, got the code here:
# https://sparkbyexamples.com/r-programming/replace-na-values-with-zero-in-r-dataframe/

mp["Powell"][is.na(mp["Powell"])] <- 0

#calculate total storage in Mead and Powell
mp$Total <- mp$Mead + mp$Powell

newdata <- as_tibble(gather(mp, 'Mead','Powell','Total', key="reservoir", value="volume" ))
#newdata <- filter(newdata, Storage>0)

# plot it
ggplot(newdata, aes(x=datetime, y=volume/1000000, colour=reservoir)) +
  theme_bw() +
  theme(plot.title = element_text(size = rel(2)),
        panel.background = element_rect(colour = NA),
        plot.background = element_rect(colour = NA),
        plot.subtitle = element_text(size = rel(1.5)),
        axis.title = element_text(face = "bold",size = rel(1))) +
  geom_line(size=1) +
  ylab("millions of acre feet") +
  xlab("Data: USBR\nGraph:John Fleck, Utton Center, University of New Mexico School of Law\n
       Code and data: https://github.com/johnrfleck/colorado-river") +
  ggtitle("Combined Storage, Lakes Mead and Powell")

# mead-powell storage graph
# revised December 2022 to pull data directly from USBR
library(ggplot2)
library(tidyverse)
library(readr)


# read data from USBR web site


mead <- read_csv("https://www.usbr.gov/uc/water/hydrodata/reservoir_data/921/csv/17.csv")
powell <- read_csv("https://www.usbr.gov/uc/water/hydrodata/reservoir_data/919/csv/17.csv")

# merge the two datasets
mp <- full_join(mead, powell, by = "datetime")

#rename columns
mp <- mp %>%
  rename(Mead = storage.x) %>%
  rename(Powell = storage.y)

# replace NA's in Powell column with zeros
# I have no idea how this works, got the code here:
# https://sparkbyexamples.com/r-programming/replace-na-values-with-zero-in-r-dataframe/

mp["Powell"][is.na(mp["Powell"])] <- 0

#calculate total storage in Mead and Powell
mp$Total <- mp$Mead + mp$Powell

newdata <- as_tibble(gather(mp, 'Mead','Powell','Total', key="reservoir", value="volume" ))
#newdata <- filter(newdata, Storage>0)

# plot it
ggplot(newdata, aes(x=datetime, y=volume/1000, colour=reservoir)) +
  theme_bw() +
  theme(plot.title = element_text(size = rel(2)),
        panel.background = element_rect(colour = NA),
        plot.background = element_rect(colour = NA),
        plot.subtitle = element_text(size = rel(1.5)),
        axis.title = element_text(face = "bold",size = rel(1))) +
  geom_line(size=1) +
  ylab("millions of acre feet") +
  xlab("Data: USBR\nGraph:John Fleck, Utton Center, University of New Mexico School of Law\n
       Code and data: https://github.com/johnrfleck/colorado-river") +
  ggtitle("Combined Storage, Lakes Mead and Powell")

