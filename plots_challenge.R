library(tidyverse)
full_trains <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-02-26/full_trains.csv")

# challenge 1
p1 <- ggplot(data=full_trains, aes(x=journey_time_avg)) + geom_histogram(binwidth = 30) + xlab("Journey Time (mins.)") + ylab("Number of Instances")

# challenge 2
full_trains$service2 <- rep("National", nrow(full_trains))
full_trains$service2[which(full_trains$service=="International")] <- "0-Other"
full_trains$service2[which(is.na(full_trains$service==TRUE))] <- "0-Other"
full_trains$service2 <- factor(full_trains$service2, exclude=NA)
p2 <- ggplot(data=full_trains, aes(x=journey_time_avg, group=service2, fill=service2)) + geom_histogram(binwidth = 20) + xlab("Journey Time (mins.)") + ylab("Number of Instances") + 
  theme(legend.position = "none") + scale_fill_manual(values=c("grey", "red"))