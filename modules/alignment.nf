process ALIGN {

    input:
    path reads
    path genome_files

    output:
    path "${reads.baseName}.sam"

    script:
    def fasta = genome_files.find { it.name.endsWith('.fa') }

    """
    ${params.bwa_bin} mem ${fasta} ${reads} > ${reads.baseName}.sam
    """
}