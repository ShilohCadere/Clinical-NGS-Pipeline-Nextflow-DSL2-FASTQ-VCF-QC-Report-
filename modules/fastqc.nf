process FASTQC {

    tag "$sample_id"

    publishDir "${params.outdir}/fastqc", mode: 'copy'

    input:
    tuple val(sample_id), path(read1), path(read2)

    output:
    path "fastqc/*", emit: fastqc_results

    script:
    """
    mkdir -p fastqc
    fastqc -o fastqc $read1 $read2
    """
}