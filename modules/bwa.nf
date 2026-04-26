process BWA_ALIGN {

    tag "$sample_id"

    input:
    tuple val(sample_id), path(read1), path(read2)
    path ref

    output:
    tuple val(sample_id), path("${sample_id}.sam")

    script:
    """
    bwa index $ref 2>/dev/null || true
    bwa mem $ref $read1 $read2 > ${sample_id}.sam
    """
}