
# Iris Flower Morphology Analysis in R
# Author: Reneilwe
# Description:
# Exploratory data analysis and visualization of the
# iris dataset using R.
# =====================================================

# -----------------------------
# 1. Load Dataset
# -----------------------------

# Load built-in iris dataset
data(iris)

# Preview first rows
head(iris)

# -----------------------------
# 2. Explore Dataset Structure
# -----------------------------

# Display dataset structure
str(iris)

# Generate summary statistics
summary(iris)

# -----------------------------
# 3. Scatter Plot Visualization
# -----------------------------

# Create scatter plot showing relationship between
# sepal length and petal length

plot(
  iris$Sepal.Length,
  iris$Petal.Length,
  
  # Color points by species
  col = as.numeric(iris$Species),
  
  # Solid circle points
  pch = 19,
  
  # Axis labels
  xlab = "Sepal Length",
  ylab = "Petal Length",
  
  # Main title
  main = "Relationship Between Sepal and Petal Length"
)

# Add legend
legend(
  "topleft",
  legend = levels(iris$Species),
  col = 1:3,
  pch = 19
)

# -----------------------------
# 4. Calculate Mean Petal Length
# -----------------------------

# Calculate overall average petal length
mean(iris$Petal.Length)

# -----------------------------
# 5. Compare Species Means
# -----------------------------

# Calculate average petal length by species
aggregate(
  Petal.Length ~ Species,
  data = iris,
  mean
)

# -----------------------------
# 6. Boxplot Visualization
# -----------------------------

# Compare petal length distributions across species

boxplot(
  Petal.Length ~ Species,
  data = iris,
  
  # Colors
  col = c("skyblue", "lightgreen", "pink"),
  
  # Labels
  main = "Petal Length Distribution by Species",
  xlab = "Species",
  ylab = "Petal Length"
)

# -----------------------------
# 7. Save Visualizations
# -----------------------------

# Save scatter plot as PNG
png(
  filename = "scatter_plot.png",
  width = 800,
  height = 600
)

plot(
  iris$Sepal.Length,
  iris$Petal.Length,
  col = as.numeric(iris$Species),
  pch = 19,
  xlab = "Sepal Length",
  ylab = "Petal Length",
  main = "Relationship Between Sepal and Petal Length"
)

legend(
  "topleft",
  legend = levels(iris$Species),
  col = 1:3,
  pch = 19
)

dev.off()

# Save boxplot
png(
  filename = "boxplot_species.png",
  width = 800,
  height = 600
)

boxplot(
  Petal.Length ~ Species,
  data = iris,
  col = c("skyblue", "lightgreen", "pink"),
  main = "Petal Length Distribution by Species",
  xlab = "Species",
  ylab = "Petal Length"
)

dev.off()

