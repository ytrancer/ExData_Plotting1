# PLEASE NOTE this will only run once plot1.R has been run

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