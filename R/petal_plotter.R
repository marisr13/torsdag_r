library(dplyr)
library(tidyr)
library(ggplot2)



# Read command-line arguments
args <- commandArgs(trailingOnly = TRUE)
species_a <- args[1] # The first argument is the name of the first species

# EXERCISE: Store the second arguments as species_b.
#
species_b <- args[2] # the second argument is the name of the second species

# EXERCISE: Convert the third argument to an integer and store it as image_size.
#
image_size <- as.integer(args[3])

# EXERCISE: Put species_a and species_b into one vector called selected_species.
#
selected_species <- c(species_a, species_b)

iris_data <- datasets::iris

species_colours <- c(
  setosa = "pink",
  versicolor = "royalblue",
  virginica = "gold"
)

# Keep only data from the selected species
#iris_subset <- iris_data[iris_data$Species %in% selected_species, ]
iris_subset <- filter(iris_data, Species %in% selected_species)

# EXERCISE: Create an output filename using species_a and species_b.
#
# Example: "iris_setosa_vs_versicolor.png"
#
output_filename <- paste0(
   "iris_",
   species_a,
  "_vs_",
   species_b,
   ".png"
 )


species_plot <- ggplot(iris_subset, aes(x=Petal.Width, y=Petal.Length, colour=Species)) +
  geom_point() + 
  scale_colour_manual(values = species_colours) +
  labs(x= "Petal width", y= "Petal length")

ggsave(
  filename = output_filename,
  plot = species_plot,
  width = image_size,
  height = image_size,
  units = "px",
  dpi = 150  
  )

