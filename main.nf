nextflow.enable.dsl=2

include { FASTQC } from './modules/fastqc.nf'
include { BWA_ALIGN } from './modules/bwa.nf'
include { SORT_BAM } from './modules/samtools.nf'
include { CALL_VARIANTS } from './modules/bcftools.nf'
include { QC_CLASSIFY } from './modules/qc_classification.nf'
include { MULTIQC } from './modules/multiqc.nf'

params.samplesheet = "data/samplesheet.csv"
params.ref         = "data/reference.fasta"
params.outdir      = "results"

workflow {

    samples = Channel
        .fromPath(params.samplesheet)
        .splitCsv(header:true)
        .map { row ->
            tuple(row.sample, file(row.fastq_1), file(row.fastq_2))
        }

    /*
     * FASTQC ONLY ONCE
     */
    fastqc_out = FASTQC(samples)

    /*
     * PIPELINE
     */
    aligned   = BWA_ALIGN(samples, file(params.ref))
    sorted    = SORT_BAM(aligned)
    variants  = CALL_VARIANTS(sorted, file(params.ref))
    QC_CLASSIFY(variants)

    /*
     * MULTIQC ONLY ONCE
     */
    MULTIQC(file("${params.outdir}/fastqc"))

    log.info "Using samplesheet: ${params.samplesheet}"
}