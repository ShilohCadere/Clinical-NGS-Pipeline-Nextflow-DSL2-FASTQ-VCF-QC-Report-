process MULTIQC {

    publishDir "${params.outdir}/multiqc", mode: 'copy'

    input:
    path fastqc_dir

    script:
    """
    multiqc $fastqc_dir -o .
    """
}