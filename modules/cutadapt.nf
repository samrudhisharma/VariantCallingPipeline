process CUTADAPT {

    tag "${reads.simpleName}"

    input:
    path reads

    output:
    path "${reads.simpleName}_trimmed.fastq.gz"

    script:
    """
    ${params.cutadapt_bin} \
        -a AGATCGGAAGAGC \
        -o ${reads.simpleName}_trimmed.fastq.gz \
        ${reads}
    """
}