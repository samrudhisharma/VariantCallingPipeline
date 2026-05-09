#!/bin/bash -ue
bcftools mpileup -f chr22.fa Sample_trimmed.fastq.sorted.bam > Sample_trimmed.fastq.sorted.pileup
bcftools call -mv -Ov -o Sample_trimmed.fastq.sorted.vcf Sample_trimmed.fastq.sorted.pileup
