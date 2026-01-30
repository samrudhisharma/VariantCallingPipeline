process CUTADAPT {

    input:
    path reads

    output:
    path "trimmed.fastq.gz"

    script:
    """
    cutadapt \
      -a AGATCGGAAGAGC \
      -o trimmed.fastq.gz \
      $reads
    """
}
