# Read the data into df specifying the format of col_date and col_time variables as date and time accordingly

library(readr)
df <- read_delim("exdata_data_household_power_consumption.zip", 
                 ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                  Time = col_time(format = "%H:%M:%S")), trim_ws = TRUE)

# Subset the data by the range of dates to use

dates <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))
df1 <- df[df$Date %in% dates,]

# Build the plot by creating a function draw_plot1, which is then used in creating a png file

draw_plot1 <- function() {
  hist(df1$Global_active_power, col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
}

png("plot1.png", width=480, height=480)
draw_plot1()
dev.off()


