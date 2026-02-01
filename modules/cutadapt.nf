process CUTADAPT {

    input:
    path reads

    output:
    path "trimmed.fastq.gz"

    script:
    """
    ${params.cutadapt_bin} \-a AGATCGGAAGAGC \-o trimmed.fastq.gz \ ${reads}
    """
}
