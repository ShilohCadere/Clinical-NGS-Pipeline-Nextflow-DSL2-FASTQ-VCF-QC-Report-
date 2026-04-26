process QC_CLASSIFY {

    tag "$sample_id"

    publishDir "${params.outdir}/qc", mode: 'copy'

    input:
    tuple val(sample_id), path(vcf)

    output:
    tuple val(sample_id), path("${sample_id}_qc.txt")

    script:
    """
    echo "QC for $sample_id" > ${sample_id}_qc.txt
    wc -l $vcf >> ${sample_id}_qc.txt
    """
}