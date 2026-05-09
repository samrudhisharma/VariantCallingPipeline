process VARIANT_CALLING {

    tag "${bam.baseName}"

    input:
    path bam
    path genome_files

    output:
    path "${bam.baseName}.vcf"

    script:
    def fasta = genome_files.find { it.name.endsWith('.fa') }

    """
    ${params.bcftools_bin} mpileup -f ${fasta} ${bam} > ${bam.baseName}.pileup
    ${params.bcftools_bin} call -mv -Ov -o ${bam.baseName}.vcf ${bam.baseName}.pileup
    """
}