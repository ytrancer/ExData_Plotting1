# PLEASE NOTE this will only run once plot1.R has been run

draw_plot2 <- function() {
  
  plot(df1$DateTime, df1$Global_active_power, type="l", 
       xlab="",
       ylab="Global Active Power (kilowatts)")
   }
 
png("plot2.png", width=480, height=480)
draw_plot2()
dev.off()