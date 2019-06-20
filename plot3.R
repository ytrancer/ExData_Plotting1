# Read the data into df specifying the format of col_date and col_time variables as date and time accordingly

library(readr)
df <- read_delim("exdata_data_household_power_consumption.zip", 
                 ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                                              Time = col_time(format = "%H:%M:%S")), NA = "?", trim_ws = TRUE)

# Subset the data by the range of dates to use

dates <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))
df1 <- df[df$Date %in% dates,]

# Add DateTime variable to df1 to make plot2, 3 and 4 show weekdays

df1$DateTime <- as.POSIXct(paste(df1$Date, df1$Time))

# Plot

draw_plot3 <- function() {
  plot(df1$DateTime, df1$Sub_metering_1,
     "n",
     xlab = "",
     ylab = "Energy sub metering")

  points(df1$DateTime, df1$Sub_metering_1, type = "l")

  points(df1$DateTime, df1$Sub_metering_2, type = "l", col = "red")

  points(df1$DateTime, df1$Sub_metering_3, type = "l", col = "blue")

  legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1))
}

png("plot3.png", width=480, height=480)
draw_plot3()
dev.off()