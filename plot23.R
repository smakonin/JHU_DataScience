# Copyright (C) 2015 by Stephen Makonin.
# to be used with the data at EPA National Emissions Inventory web site

library(ggplot2)

# load dataset
NEI <- readRDS("summarySCC_PM25.rds")
NEI$type <- factor(NEI$type)
NEI$year <- factor(NEI$year)
ds <- subset(NEI, NEI$fips == 24510)
ds <- aggregate(cbind(Emissions) ~ type + year, sum, data=ds)

# create chart and save to png
png(file="plot23.png", bg="white")

ggplot(data=ds, aes(x=year, y=Emissions, fill=type)) + geom_bar(stat="identity", position=position_dodge()) + ggtitle("Baltimore City PM2.5 Emissions by Type")

dev.off()


