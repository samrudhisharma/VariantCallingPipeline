include { FASTQC as FASTQC_RAW }      from '../modules/fastqc.nf'
include { CUTADAPT }                 from '../modules/cutadapt.nf'
include { FASTQC as FASTQC_TRIMMED } from '../modules/fastqc.nf'
include { ALIGN_AND_SORT }           from '../modules/alignment.nf'
include { VARIANT_CALLING }          from '../modules/variant.nf'

workflow QC_PIPELINE {

    main:

    // Channel for input FASTQ
    reads_ch = Channel.fromPath('data/sample1.fastq.gz')

    // Step 1: FastQC on raw reads
    FASTQC_RAW(reads_ch)

    // Step 2: Adapter trimming
    trimmed_ch = CUTADAPT(reads_ch)

    // Step 3: FastQC on trimmed reads
    FASTQC_TRIMMED(trimmed_ch)

    // Step 4: Alignment (SAM → BAM → sorted BAM + index)
    aligned_ch = ALIGN_AND_SORT(
        trimmed_ch,
        file("reference/chr22.fa")
    )

    // Step 5: Variant Calling
    VARIANT_CALLING(
    aligned_ch,
    file("reference/chr22.fa")
)

}

