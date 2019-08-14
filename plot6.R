library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimore <- NEI %>% subset(type == "ON-ROAD" & fips == "24510")
california <- NEI %>% subset(type == "ON-ROAD" & fips == "06037")
california$fips <- "Los Angeles County"
baltimore$fips <- "Baltimore City"
sub <- rbind(baltimore,california)
png("plot6.png")
g <- ggplot(data = sub, aes(factor(year),y = Emissions)) + geom_bar(stat = "identity") + facet_grid(. ~ fips) + ylab("Total PM25 Emission (Tons)") + xlab("Year")
g <- g + geom_bar(stat = "identity")
g
dev.off()