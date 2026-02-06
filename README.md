
# VariantCallingPipeline

## Overview
This project implements a basic Nextflow pipeline for quality control, alignment, and variant calling of sequencing data.  
The pipeline processes a single-end FASTQ file and performs read quality assessment, trimming, alignment to a reference genome, and variant detection.

## Pipeline Flow
Raw FASTQ  
↓  
FastQC (Raw Reads)  
↓  
Read Trimming  
↓  
FastQC (Trimmed Reads)  
↓  
Alignment (BAM)  
↓  
Variant Calling (VCF)

## Pipeline Steps

### Step 1: Raw Read Quality Control
- Performs quality assessment on raw FASTQ files
- Generates reports for base quality, GC content, and adapter contamination  
- **Tool:** FastQC

### Step 2: Read Trimming
- Removes adapter sequences and low-quality bases
- Improves read quality for downstream analysis  
- **Tool:** Cutadapt

### Step 3: Quality Control After Trimming
- Runs FastQC on trimmed reads
- Confirms improvement in read quality  
- **Tool:** FastQC

### Step 4: Read Alignment
- Aligns trimmed reads to the reference genome (chr22)
- Produces sorted and indexed BAM files  
- **Tools:** BWA, Samtools

### Step 5: Variant Calling
- Identifies genetic variants from aligned BAM files
- Generates variant output in VCF format  
- **Tool:** BCFtools

## Input Data
- Single FASTQ file: `data/sample_R1.fastq`
- Reference genome: `data/reference/chr22.fa`

> Input data is used locally and is not included in the GitHub repository.

## Output
- FastQC reports (raw and trimmed)
- Trimmed FASTQ file
- Sorted BAM and BAI files
- Variant file (VCF)

> All outputs are generated within the Nextflow working directory during execution.

## Project Structure
```bash
nf_pipeline/
├── main.nf
├── nextflow.config
├── environment.yml
├── README.md
├── modules/
│ ├── fastqc.nf
│ ├── cutadapt.nf
│ ├── align.nf
│ └── variant_calling.nf
└── workflows/
└── workflow.nf



## Requirements
Nextflow
Conda
Tools installed via environment.yml


---
```
## After adding this
 push it to github:

## 1. Clone the Repository
```bash

git clone <your-github-repo-url>
cd nf_pipeline
---
```
## 2. Create and Activate Conda Environment
conda env create -f environment.yml
conda activate bnf

---

## How to Run the Pipeline

```bash
nextflow run main.nf
---
```
## To resume a previous run:
```bash
nextflow run main.nf -resume
