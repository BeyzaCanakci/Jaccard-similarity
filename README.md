
# Jaccard Similarity

This repository contains an R script for calculating the Jaccard similarity between two sets. The Jaccard similarity is a statistic used for comparing the similarity and diversity of sample sets. It is defined as the size of the intersection divided by the size of the union of the sample sets.

## Features

- Input two sets as vectors in R
- Calculates the Jaccard similarity coefficient
- Simple and easy to use

## Usage

1. Clone or download this repository.
2. Open the `jaccard-similarity.R` script in R or RStudio.
3. Edit the script to define your two sets. Example:

```r
set1 <- c("apple", "banana", "cherry")
set2 <- c("banana", "cherry", "date")
```

4. Run the script to see the Jaccard similarity result.

## Example

```r
# Example sets
set1 <- c("apple", "banana", "cherry")
set2 <- c("banana", "cherry", "date")

# Calculate Jaccard similarity
intersection <- length(intersect(set1, set2))
union <- length(union(set1, set2))
jaccard_similarity <- intersection / union

cat("Jaccard Similarity:", jaccard_similarity, "\n")
```

**Output:**
```
Jaccard Similarity: 0.5
```

