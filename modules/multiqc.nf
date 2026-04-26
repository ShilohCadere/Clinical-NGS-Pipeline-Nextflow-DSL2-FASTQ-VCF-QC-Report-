process MULTIQC {

    publishDir "${params.outdir}/multiqc", mode: 'copy'

    input:
    path qc_dir

    output:
    path "multiqc_report.html"

    script:
    """
    multiqc ${qc_dir} -o .
    """
}