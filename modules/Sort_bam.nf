process SORT_BAM {

    tag "${bam.baseName}"

    input:
    path bam

    output:
    tuple path("${bam.baseName}.sorted.bam"), path("${bam.baseName}.sorted.bam.bai")

    script:
    """
    # Sort BAM
    ${params.samtools_bin} sort \
        -o ${bam.baseName}.sorted.bam \
        -T ${bam.baseName}_tmp \
        ${bam}

    # Index sorted BAM
    ${params.samtools_bin} index ${bam.baseName}.sorted.bam
    """
}