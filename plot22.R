# Copyright (C) 2015 by Stephen Makonin.
# to be used with the data at EPA National Emissions Inventory web site

# load dataset
NEI <- readRDS("summarySCC_PM25.rds")
NEI$type <- factor(NEI$type)
NEI$year <- factor(NEI$year)
ds <- subset(NEI, NEI$fips == 24510)
ds <- aggregate(cbind(Emissions) ~ year, sum, data=ds)

# create chart and save to png
png(file = "plot22.png", bg = "white")

barplot(ds$Emissions, main = "Baltimore City PM2.5 Emissions", ylab = "PM2.5 Emissions (in mega-tons)", xlab = "Year", col = "red", names.arg=ds$year)

dev.off()
