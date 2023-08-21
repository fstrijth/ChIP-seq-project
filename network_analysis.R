library("STRINGdb")
db <- STRINGdb$new(species= 7227, version="12", score_threshold=400) #version and score threshold set to default values

genes <- read.csv("Annotation_genomic_features.csv")
#NEED: pvalue, logFC, gene