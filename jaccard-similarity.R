library(readxl)
library(ggplot2)
library(reshape2)
library(pheatmap)
# Jaccard similarity index is used here, and it is based on the intersection divided by the union feature for different groups
# File path
path <- "/Users/b/Desktop/blood/jaccard/"

# Defining the cancer types
cancer_types <- c("HNSC", "ESCA", "STAD", "CRC", "COAD")

#Reading Excel files and saving it as a list 
xlsx_files <- list.files(path, pattern = "\\.xlsx$", full.names = TRUE)
cancer_microbes <- list()

for (file in xlsx_files) {
  cancer_type <- gsub("\\.xlsx$", "", basename(file))  # Taking cancer name from the name of files
  if (cancer_type %in% cancer_types) {
    df <- read_excel(file)  # reading excel file
    cancer_microbes[[cancer_type]] <- unique(gsub("[._]", "", df$s__))

  }
}


#  Creating Jaccard matrix
jaccard_matrix <- matrix(0, nrow = length(cancer_types), ncol = length(cancer_types),
                         dimnames = list(cancer_types, cancer_types))

for (i in 1:length(cancer_types)) {
  for (j in i:length(cancer_types)) {
    set1 <- cancer_microbes[[cancer_types[i]]]
    set2 <- cancer_microbes[[cancer_types[j]]]
    
    intersection <- length(intersect(set1, set2))  # Common/intersection features/species
    union <- length(union(set1, set2))  # Union features/species of each cancer types 
    jaccard_index <- ifelse(union == 0, 0, intersection / union)  # Jaccard formula
    
    jaccard_matrix[i, j] <- jaccard_matrix[j, i] <- jaccard_index
  }
}


# Drawing Heatmap 
pheatmap(jaccard_matrix, display_numbers = TRUE, 
         color = colorRampPalette(c("white", "pink"))(100),
         main = "Jaccard Similarity Between Cancer Types (Based on common species-traditional approach)",cluster_rows = FALSE, cluster_cols = FALSE)


