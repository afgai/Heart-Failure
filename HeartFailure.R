heartfailure_data <- read.csv(file.choose())

#throwing a function to give a climpse of the data 
glimpse(heartfailure_data)

#summary of data
skim_without_charts(heartfailure_data)

#accessing the first few rows of the data
head(heartfailure_data)

#sorting the data from the lowest year to highest
heartfailure_data %>% arrange(YEAR..DISPLAY.)

#ensuring to remove any dupliate data 
heartfailure_data <- heartfailure_data[!duplicated(heartfailure_data)] 

heartfailure_data$diabetes <- as.factor(heartfailure_data$diabetes)
heartfailure_data$DEATH_EVENT <- as.factor(heartfailure_data$DEATH_EVENT)

# Plot anaemia vs death event
ggplot(heartfailure_data, aes(x = diabetes, fill = DEATH_EVENT)) +
  geom_bar(position = "dodge") +
  labs(title = "Diabetes vs Death Event",
       x = "Diabetes (0 = No, 1 = Yes)",
       y = "Count",
       fill = "Death Event") +
  theme_minimal()


heartfailure_data$high_blood_pressure <- as.factor(heartfailure_data$high_blood_pressure)
heartfailure_data$DEATH_EVENT <- as.factor(heartfailure_data$DEATH_EVENT)

ggplot(heartfailure_data, aes(x = high_blood_pressure, fill = DEATH_EVENT)) +
  geom_bar(position = "dodge") +
  labs(title = "High Blood Pressure vs Death Event",
       x = "Diabetes (0 = No, 1 = Yes)",
       y = "Count",
       fill = "Death Event") +
  theme_minimal()



