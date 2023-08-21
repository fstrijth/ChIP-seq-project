library(ChIPseeker)
library(org.Dm.eg.db)
library(TxDb.Dmelanogaster.UCSC.dm6.ensGene)
library(ReactomePA)

#Annotation of genomic features
peak <- readPeakFile("macs2/overlapping.bed")
txdb <- TxDb.Dmelanogaster.UCSC.dm6.ensGene
peakAnno <- annotatePeak(peak, annoDb="org.Dm.eg.db", TxDb = txdb, tssRegion = c(-2000, 2000))
plotAnnoBar(peakAnno)
plotDistToTSS(peakAnno, title="Distribution of transcription factor-binding loci\nrelative to TSS")
write.csv(as.data.frame(peakAnno), "Annotation_genomic_features.csv")

#Functional enrichment analysis
pathway <- enrichPathway(as.data.frame(peakAnno)$ENTREZID, organism="fly")
write.csv(as.data.frame(pathway), "Gene_sets.csv")
dotplot(pathway)
