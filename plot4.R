library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Data <- merge(NEI,SCC,by = "SCC")
CCSources <- Data[grep("coal",Data$Short.Name,ignore.case = TRUE),]
png("plot4.png")
g <- ggplot(data = CCSources,aes(x = factor(year),y = Emissions/1000)) + geom_bar(stat = "identity")
g <- g + ylab("Total PM25 Emiission (kilo Tons)") + xlab("Year")
g
dev.off()