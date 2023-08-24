$ macs2 callpeak -t ../filtered_ENCFF515LPH.bam -n ENCFF515LPH
$ bedtools intersect -v -a ENCFF515LPH_peaks.narrowPeak -b ../dm6-blacklist.v2.bed.gz > noblacklist_ENCFF515LPH.bed
$ bedtools intersect -wo -f 0.3 -r -a noblacklist_ENCFF515LPH.bed -b noblacklist_ENCFF708WHR.bed > overlapping.bed
$ bamCoverage -b filtered_ENCFF708WHR.bw -o filtered_ENCFF708WHR.bw
$ computeMatrix reference-point --referencePoint center -b 2000 -a 2000 -R macs2/overlapping.bed -S filtered_ENCFF515LPH.bw filtered_ENCFF708WHR.bw -o matrix.gz --missingDataAsZero
$ plotHeatmap -m matrix.gz -out heatmap4.png