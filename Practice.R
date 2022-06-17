# Load Data
install.packages("nycflights13")
library(nycflights13)
library(dplyr)

# view Data
View(flights)

#View first 6 data
head(flights)

#Total columns
ncol(flights)

#Total Rows
nrow(flights)

#All column names
colnames(flights)

#Using Filter() to manipulate data
f1 <- filter(flights,flights$month==7 & flights$day==1)
View(f1)

#Filtering multiple things
f2 <- filter(flights, flights$month == 1, flights$day == 1)
View(f2)

#Filtering inline
View(filter(flights, flights$month==1, flights$day==1, flights$origin=='LGA'))

#Slice() to select rows by position
slice(flights, 1:10)

#mutate() to add a new column
overall_delay = mutate(flights ,overall_delay = flights$arr_delay + flights$dep_delay)

View(overall_delay)

head(overall_delay)

#transmute() function to show only new columns :)
overall_delay <- transmute(flights, over_delay = flights$arr_delay - flights$dep_delay)

View(overall_delay)

#summarize() used to find descriptive statistics
summarise(flights, average_air_time = mean(flights$air_time, na.rm = T)) #Summarizing average air time
summarise(flights, total_air_time = sum(flights$air_time, na.rm = TRUE)) #Summarizing sum (total) air time
summarise(flights, standard_deviation = sd(flights$air_time, na.rm = T)) #Summarizing Standard Deviation of air time
summarise(flights, average_air_time = mean(flights$air_time, na.rm = T), total_air_time = sum(flights$air_time, na.rm = TRUE)) #Summarizing by more than one statement

#group_by() to group data frames
library(datasets)

View(mtcars) #Seeing the mtcars data set

head(mtcars) #First 6 rows

colnames(mtcars) #Column names (All)
ncol(mtcars) #Total number of columns

nrow(mtcars) #Total number of rows

by_gears = mtcars %>% #Piping
  group_by(gear)

first_summary = summarise(by_gears, Total_Gears = sum(gear), Average_Gears = mean(gear))
print(first_summary)


#arrange() to sort data sets
View(arrange(flights, year, flights$dep_time))

#nesting (piping)
results = flights %>% 
  arrange(flight,year) %>% 
  filter(origin == 'LGA')

View(results)

























