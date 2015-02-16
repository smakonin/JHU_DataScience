# Copyright (C) 2015 by Stephen Makonin.
# to be used with the data at EPA National Emissions Inventory web site

# load datasets
NEI <- readRDS("summarySCC_PM25.rds")
NEI$type <- factor(NEI$type)
NEI$year <- factor(NEI$year)

SCC <- readRDS("Source_Classification_Code.rds")
codes <- subset(SCC, grepl('vehicle|car|motor|truck', Short.Name, ignore.case=TRUE))$SCC

ds <- subset(NEI, NEI$fips == 24510 & NEI$SCC %in% codes)
ds <- aggregate(cbind(Emissions) ~ year, sum, data=ds)

# create chart and save to png
png(file="plot25.png", bg="white")

barplot(ds$Emissions, main="Baltimore City Motor Vehicle PM2.5 Emissions", ylab="PM2.5 Emissions (in tons)", xlab="Year", col="red", names.arg=ds$year)

dev.off()



