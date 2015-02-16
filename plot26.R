# Copyright (C) 2015 by Stephen Makonin.
# to be used with the data at EPA National Emissions Inventory web site

library(ggplot2)

# load datasets
NEI <- readRDS("summarySCC_PM25.rds")
NEI$type <- factor(NEI$type)
NEI$year <- factor(NEI$year)

SCC <- readRDS("Source_Classification_Code.rds")
codes <- subset(SCC, grepl('vehicle|car|motor|truck', Short.Name, ignore.case=TRUE))$SCC

ds <- subset(NEI, NEI$fips %in% c("24510", "06037") & NEI$SCC %in% codes)
ds <- aggregate(cbind(Emissions) ~ year + fips, sum, data=ds)
ds$city <- ifelse(ds$fips == "24510", "Baltimore", "Los Angeles")

# create chart and save to png
png(file="plot26.png", bg="white")

ggplot(data=ds, aes(x=year, y=Emissions, fill= city)) + geom_bar(stat="identity", position=position_dodge()) + ggtitle("Baltimore vs. Los Angeles  PM2.5 Emissions by Vehicles")

dev.off()



