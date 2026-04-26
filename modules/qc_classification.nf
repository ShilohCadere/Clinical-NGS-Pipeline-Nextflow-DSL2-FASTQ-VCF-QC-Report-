process QC_CLASSIFY {

    tag "$sample"

    publishDir "${params.outdir}/qc", mode: 'copy'

    input:
    tuple val(sample), path(vcf)

    output:
    tuple val(sample), path("${sample}_qc.txt")

    script:
    """
    echo "QC Report for sample: ${sample}" > ${sample}_qc.txt
    echo "VCF file: ${vcf}" >> ${sample}_qc.txt
    wc -l ${vcf} >> ${sample}_qc.txt
    """
}