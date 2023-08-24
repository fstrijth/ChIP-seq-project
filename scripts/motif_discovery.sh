$ bedtools getfasta -fi ../dm6.fa -bed overlapping.bed -fo overlapping.fa
$ meme-chip -oc meme_output -db motif_databases/FLY/OnTheFly_2014_Drosophila.meme macs2/overlapping.fa