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
    bcftools mpileup -f $ref $bam | \
    bcftools call -mv -Ov -o ${bam.baseName}.vcf
    """
}
