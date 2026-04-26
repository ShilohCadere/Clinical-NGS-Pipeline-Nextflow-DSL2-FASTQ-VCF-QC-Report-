process SORT_BAM {

    tag "$sample"

    publishDir "${params.outdir}/bam", mode: 'copy'

    input:
    tuple val(sample), path(sam)

    output:
    tuple val(sample), path("${sample}.sorted.bam"), path("${sample}.sorted.bam.bai")

    script:
    """
    samtools view -Sb ${sam} | samtools sort -o ${sample}.sorted.bam
    samtools index ${sample}.sorted.bam
    """
}