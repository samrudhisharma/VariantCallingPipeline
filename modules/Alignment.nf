process ALIGN_AND_SORT {

    // Show input file name in Nextflow logs
    tag "${fastq.baseName}"

    input:
    // Trimmed FASTQ file from CUTADAPT
    path fastq

    // Reference genome (chromosome 22)
    path ref

    output:
    // Sorted BAM file and its index
    tuple path("${fastq.baseName}.sorted.bam"),
          path("${fastq.baseName}.sorted.bam.bai")

    script:
    """
    # Align reads to reference genome using BWA-MEM
    ${params.bwa_bin} mem ${ref} ${fastq} | \
        ${params.samtools_bin} view -bS - | \
        ${params.samtools_bin} sort -o ${fastq.baseName}.sorted.bam

    # Index the sorted BAM file
    ${params.samtools_bin} index ${fastq.baseName}.sorted.bam
    """
}
