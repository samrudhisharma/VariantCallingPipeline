#!/bin/bash -ue
# Sort BAM
/home/samrudhi0409/miniconda3/envs/bnf/bin/samtools sort         -o Sample_trimmed.fastq.sorted.bam         -T Sample_trimmed.fastq_tmp         Sample_trimmed.fastq.bam

# Index sorted BAM
/home/samrudhi0409/miniconda3/envs/bnf/bin/samtools index Sample_trimmed.fastq.sorted.bam
