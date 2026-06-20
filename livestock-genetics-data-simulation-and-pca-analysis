#Livestock Genetics Data Simulation and PCA Analysis
# Author: Reneilwe R. Mogano 
# Project: Population Genetics & Livestock Data Analysis
# =========================================================
# Install Packages
install.packages("tidyverse")
install.packages("factoextra")
install.packages("corrplot")

# -----------------------------
# 1. Load Required Libraries
# -----------------------------
library(tidyverse)
library(factoextra)
library(corrplot)
-----------------------------------
# 2. Set Seed for Reproducibility
# -----------------------------
# Ensures reproducible results across runs

set.seed(123)

# -----------------------------
# 3. Simulate Livestock Dataset
# -----------------------------

n <- 100

livestock_data <- data.frame(
  
  Animal_ID = paste0("A", 1:n),
  
  Breed = sample(
    c("Bos indicus", "Bos taurus", "Crossbred"),
    n,
    replace = TRUE
  ),
  
  Weight_kg = round(
    rnorm(n, mean = 450, sd = 80),
    1
  ),
  
  Milk_Production_L = round(
    rnorm(n, mean = 12, sd = 4),
    1
  ),
  
  Genotype_Score = round(
    runif(n, 0.2, 1.0),
    2
  ),
  
  SNP_Count = sample(
    1000:5000,
    n,
    replace = TRUE
  ),
  
  Health_Score = round(
    runif(n, 0.5, 1.0),
    2
  ),
  
  Farm_Region = sample(
    c(
      "Gauteng",
      "Limpopo",
      "Free State",
      "KwaZulu-Natal"
    ),
    n,
    replace = TRUE
  )
)

# -----------------------------
# 4. Export Dataset
# -----------------------------
write.csv(
  livestock_data,
  "livestock_genetics_data.csv",
  row.names = FALSE
)

# Preview dataset
head(livestock_data)

# -----------------------------
# 5. Summary Statistics
# -----------------------------
summary(livestock_data)

# -----------------------------
# 6. Select Variables for PCA
# -----------------------------

pca_data <- livestock_data %>%
  select(
    Weight_kg,
    Milk_Production_L,
    Genotype_Score,
    SNP_Count,
    Health_Score
  )

# -----------------------------
# 7. Standardize Variables
# -----------------------------
pca_scaled <- scale(pca_data)

# -----------------------------
# 8. Perform PCA
# -----------------------------
pca_result <- prcomp(
  pca_scaled,
  center = TRUE,
  scale. = TRUE
)

# PCA summary
summary(pca_result)

# -----------------------------
# 9. PCA Visualization
# -----------------------------

fviz_pca_ind(
  pca_result,
  geom.ind = "point",
  col.ind = livestock_data$Breed,
  palette = "jco",
  addEllipses = TRUE,
  legend.title = "Breed"
)

# -----------------------------
# 10. Scree Plot
# -----------------------------

fviz_eig(
  pca_result,
  addlabels = TRUE,
  ylim = c(0, 60)
)

# -----------------------------
# 11. Variable Contribution Plot
# -----------------------------

fviz_pca_var(
  pca_result,
  col.var = "contrib"
)

# -----------------------------
# 12. Correlation Heatmap
# -----------------------------

cor_matrix <- cor(pca_data)

corrplot::corrplot(
  cor_matrix,
  method = "color",
  type = "upper"
)
