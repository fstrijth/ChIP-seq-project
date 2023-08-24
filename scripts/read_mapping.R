#Adapted from TP2: read mapping
library(ShortRead)
library(Biostrings)
library(Rsubread)

#id = "ENCFF515LPH"
id = "ENCFF708WHR"

# LOADING AND TRIMMING FASTQ READS
fq <- readFastq(paste(id,".fastq.gz",sep=""))
length(fq)
trimmed_reads <- trimEnds(fq, "4")
summary(width(sread(trimmed_reads)))
filtered_reads <- fq[width(trimmed_reads) >= 40]
length(filtered_reads)
writeFastq(filtered_reads, paste("trimmed_",id,".fastq",sep=""), mode="a")

# MAPPING READS
buildindex(basename="dm6_index", reference="dm6.fa.gz")
align(index="dm6_index", readfile1 = paste("trimmed_",id,".fastq",sep=""), type="rna", output_file=paste(id,".bam",sep=""))
