library(dplyr)
library(readr)

# Function to filter Illuminance Data
filter_illuminance <- function(input_file) {
  original_data <- read.csv(input_file)
  illuminance_columns <- original_data[, grep("Illuminance", colnames(original_data))]
  return(illuminance_columns)
}

# Function to calculate statistics
calculate_statistics <- function(illuminance_data) {
  illuminance_data[illuminance_data == 0] <- NA
  statistics <- data.frame(
    Analysis_Name = colnames(illuminance_data),
    Max_Value = apply(illuminance_data, 2, max, na.rm = TRUE),
    Min_Value = apply(illuminance_data, 2, min, na.rm = TRUE),
    Median_Value = apply(illuminance_data, 2, median, na.rm = TRUE),
    Average_Value = apply(illuminance_data, 2, mean, na.rm = TRUE)
  )
  return(statistics)
}

# Function for preprocessing and combining data
preprocess_combine <- function(statistics, group_number, test_names) {
  statistics$Hour <- gsub(".*\\.(\\d{2})\\.ANALYSIS_AnalysisPlane.*", "\\1", statistics$Analysis_Name)
  statistics$Analysis_Name <- gsub(".*AnalysisPlane_", "", statistics$Analysis_Name)
  statistics$Analysis_Name <- gsub("\\.Illuminance\\.", ".", statistics$Analysis_Name)
  statistics$Analysis_Name <- gsub("\\.\\..*", "", statistics$Analysis_Name)
  statistics$Hour <- gsub("\\..*", "", statistics$Hour)
  statistics$Hour <- gsub("x|\\.", "", statistics$Hour, ignore.case = TRUE)
  statistics$Analysis_Name <- paste("Room", statistics$Analysis_Name)
  test_name <- test_names[as.numeric(group_number)]
  statistics$Test_Name <- test_name
  return(statistics)
}

# Function for organizing data by season
organize_by_season <- function(all_data) {
  season_data <- split(all_data, all_data$Test_Name)
  return(season_data)
}

# Main Script
num_files <- 10  # Define the number of input files
test_names <- c("01-SpringEquinox", "02-SummerSolstice", "03-AutumnEquinox", "04-WinterSolstice")

all_data <- list()

for (i in 1:num_files) {
  input_file_name <- sprintf("Input_%03d.csv", i)
  illuminance_data <- filter_illuminance(input_file_name)
  statistics <- calculate_statistics(illuminance_data)
  combined_data <- preprocess_combine(statistics, i, test_names)
  all_data[[i]] <- combined_data
}

# Combine all data and organize by season
all_combined_data <- do.call(rbind, all_data)
season_data <- organize_by_season(all_combined_data)

# Save final output for each season
for (season in names(season_data)) {
  output_filename <- paste0("Season_", season, "_summary.csv")
  write.csv(season_data[[season]], output_filename, row.names = FALSE)
}
