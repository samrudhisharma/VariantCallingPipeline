process FASTQC {

    tag "${reads.simpleName}"

    input:
    path reads

    output:
    path "${reads.simpleName}_fastqc.html"
    path "${reads.simpleName}_fastqc.zip"

    script:
    """
    ${params.fastqc_bin} ${reads}
    """
}
