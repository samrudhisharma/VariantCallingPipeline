#!/bin/bash -ue
/home/samrudhi0409/miniconda3/envs/bnf/bin/bcftools mpileup -f chr22.fa Sample_trimmed.fastq.sorted.bam > Sample_trimmed.fastq.sorted.pileup
/home/samrudhi0409/miniconda3/envs/bnf/bin/bcftools call -mv -Ov -o Sample_trimmed.fastq.sorted.vcf Sample_trimmed.fastq.sorted.pileup
