process SAM_TO_BAM {

    tag "${sam.baseName}"

    input:
    path sam

    output:
    path "${sam.baseName}.bam"

    script:
    """
    ${params.samtools_bin} view -b ${sam} -o ${sam.baseName}.bam
    """
}