include { FASTQC as FASTQC_RAW }      from '../modules/fastqc.nf'
include { CUTADAPT }                  from '../modules/cutadapt.nf'
include { FASTQC as FASTQC_TRIMMED }  from '../modules/fastqc.nf'
include { ALIGN }                     from '../modules/alignment.nf'
include { SAM_TO_BAM }                from '../modules/Sam_to_Bam.nf'
include { SORT_BAM }                  from '../modules/Sort_bam.nf'
include { VARIANT_CALLING }           from '../modules/variant_calling.nf'

workflow QC_PIPELINE {
    main:
    // Input channels
    reads_ch = channel.fromPath('data/Sample.fastq.gz')
    
    // FIX 1: Use .collect() so the reference files are treated as a single 
    // bundle that can be reused in multiple processes.
    ref_ch   = channel.fromPath('reference/chr22.fa*').collect()

    FASTQC_RAW(reads_ch)
    trimmed_ch = CUTADAPT(reads_ch)
    FASTQC_TRIMMED(trimmed_ch)

    // Step 4: Alignment
    sam_ch = ALIGN(trimmed_ch, ref_ch)

    // Step 5 & 6
    bam_ch = SAM_TO_BAM(sam_ch)
    sorted_bam_ch = SORT_BAM(bam_ch)
    sorted_bam_only = sorted_bam_ch.map { bam, bai -> bam }

    // Step 7: Variant Calling (ref_ch is still available because of .collect())
    VARIANT_CALLING(sorted_bam_only, ref_ch)
}