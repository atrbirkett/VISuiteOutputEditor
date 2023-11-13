# Load required packages
library(ggplot2)
library(dplyr)

# Define a custom font family and filename
Filename <- "your_file_path.csv" #The file to use
TestSeason <- "Winter Solstice" #To appear as the graph title
font_family_custom <- "Latin Modern Math" #Custom font

# Read the CSV data from a file (replace "your_file_path.csv" with the actual file name)
data <- read.csv(Filename)

plot <- ggplot(data, aes(x = Hour, group = 1)) +
  geom_area(aes(y = Max_Value, fill = "Max Value"), size = 1.5, alpha = 0.7) + # Use alpha for transparency
  geom_area(aes(y = Average_Value, fill = "Average Value"), size = 1.5, alpha = 0.7) + # Use alpha for transparency
  labs(title = paste(TestSeason, "Illumination for", unique(data$Analysis_Name)),
       x = "Hours",
       y = "Value (Lx)") +
  scale_fill_manual(values = c("Max Value" = "#17a398", "Average Value" = "#7a306c")) +
  scale_y_continuous(limits = c(0, 5000), minor_breaks = seq(0, 100000, by = 500)) +  # Adjust y-axis range
  theme_minimal() +
  theme(text = element_text(family = font_family_custom)) +
  facet_wrap(~ Analysis_Name, ncol = 1)  # Create separate facets for each Analysis_Name

# Save the plot as an SVG file with the specified width in millimeters
ggsave("TechnicalModel_CAP_WinterSolstice.svg", plot, width = 139.995/25.4, height = 231/25.4)