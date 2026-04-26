process CALL_VARIANTS {

    tag "$sample_id"

    publishDir "${params.outdir}/vcf", mode: 'copy'

    input:
    tuple val(sample_id), path(bam), path(bai)
    path ref

    output:
    tuple val(sample_id), path("${sample_id}.vcf")

    script:
    """
    bcftools mpileup -f $ref -Ou $bam | bcftools call -mv -Ov -o ${sample_id}.vcf
    """
}