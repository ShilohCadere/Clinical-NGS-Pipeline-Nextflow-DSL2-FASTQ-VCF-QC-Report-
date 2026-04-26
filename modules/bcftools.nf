process CALL_VARIANTS {

    tag "$sample"

    publishDir "${params.outdir}/vcf", mode: 'copy'

    input:
    tuple val(sample), path(bam), path(bai)
    path ref

    output:
    tuple val(sample), path("${sample}.vcf")

    script:
    """
    bcftools mpileup -f ${ref} -Ou ${bam} | \
    bcftools call -mv -Ov -o ${sample}.vcf
    """
}