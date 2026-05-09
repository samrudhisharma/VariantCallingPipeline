#!/bin/bash -ue
bwa mem chr22.fa Sample_trimmed.fastq.gz > Sample_trimmed.fastq.sam
