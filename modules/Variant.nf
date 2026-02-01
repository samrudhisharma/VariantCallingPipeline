process VARIANT_CALLING {

    tag "${bam.baseName}"

    input:
    // BAM and BAI coming together from alignment
    tuple path(bam), path(bai)

    // Reference genome (chr22)
    path ref

    output:
    path "${bam.baseName}.vcf"

    script:
    """
    ${params.bcftools_bin} mpileup -f ${ref} ${bam} | \
    ${params.bcftools_bin} call -mv -Ov -o ${bam.baseName}.vcf
    """
}