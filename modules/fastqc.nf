process FASTQC {

    publishDir "${params.outdir}/fastqc", mode: 'copy'

    input:
    tuple val(sample), path(fastq1), path(fastq2)

    output:
    path "fastqc/*"

    script:
    """
    mkdir -p fastqc
    fastqc -o fastqc ${fastq1} ${fastq2}
    """
}