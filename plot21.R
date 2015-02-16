# Copyright (C) 2015 by Stephen Makonin.
# to be used with the data at EPA National Emissions Inventory web site

# load dataset
NEI <- readRDS("summarySCC_PM25.rds")
NEI$type <- factor(NEI$type)
NEI$year <- factor(NEI$year)
ds <- aggregate(cbind(Emissions) ~ year, sum, data=NEI)
ds$Emissions <- ds$Emissions / 1000000

# create chart and save to png
png(file="plot21.png", bg="white")

barplot(ds$Emissions, main="Yearly PM2.5 Emissions", ylab="PM2.5 Emissions (in tons)", xlab="Year", col="red", names.arg=ds$year)

dev.off()
