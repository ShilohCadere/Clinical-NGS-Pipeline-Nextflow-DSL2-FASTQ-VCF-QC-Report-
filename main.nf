nextflow.enable.dsl=2

include { FASTQC } from './modules/fastqc.nf'
include { BWA_ALIGN } from './modules/bwa.nf'
include { SORT_BAM } from './modules/samtools.nf'
include { CALL_VARIANTS } from './modules/bcftools.nf'
include { MULTIQC } from './modules/multiqc.nf'
include { QC_CLASSIFY } from './modules/qc_classification.nf'

params.reads = "data/*_{1,2}.fastq.gz"
params.ref   = "data/reference.fasta"
params.outdir = "results"

workflow {

    /*
     * FIXED: proper file pairing
     */
    read_pairs = Channel
        .fromFilePairs(params.reads, flat: false)
        .map { id, files ->
            tuple(id, files[0], files[1])
        }

    /*
     * QC
     */
    fastqc_out = FASTQC(read_pairs)

    /*
     * ALIGNMENT PIPELINE
     */
    aligned = BWA_ALIGN(read_pairs, file(params.ref))
    sorted  = SORT_BAM(aligned)
    variants = CALL_VARIANTS(sorted, file(params.ref))

    QC_CLASSIFY(variants)

    /*
     * MULTIQC consumes actual FASTQC outputs
     */
    MULTIQC(fastqc_out.fastqc_results)
}