# Clinical NGS Pipeline (Nextflow + Docker)

A reproducible, modular next-generation sequencing (NGS) pipeline built using Nextflow DSL2 and Docker, simulating a clinical-grade workflow for sequencing QC, alignment, variant calling, and reporting.

This project demonstrates end-to-end bioinformatics pipeline design aligned with real-world clinical genomics environments, including QC validation, structured sample tracking, and automated reporting.

## Pipeline Overview
```
FASTQ → QC (FastQC) → Alignment (BWA-MEM)
→ Sorting & Indexing (samtools)
→ Variant Calling (bcftools)
→ QC Classification → MultiQC Report
```
 
## Features
- Modular Nextflow DSL2 pipeline architecture
- Fully containerized execution using Docker
- Paired-end FASTQ processing
- Automated QC generation and aggregation
- Variant calling using bcftools
- Structured sample tracking via samplesheet input
- Reproducible workflow suitable for clinical-style environments

## Input Requirements
### Samplesheet format (CSV)
```
sample,fastq_1,fastq_2
sample1,data/sample_1.fastq.gz,data/sample_2.fastq.gz
```

### Reference genome
```
data/reference.fasta
```

## Quick Start
1. Build container
```
docker build -t ngs-pipeline:1.0 .
```
2. Run pipeline
```
nextflow run main.nf \
  -profile docker \
  --samplesheet data/samplesheet.csv \
  --ref data/reference.fasta
```

## Outputs

All results are written to ```results/```:

FastQC reports → ```results/fastqc/```  
Aligned BAM files → ```results/bam/```  
Variant calls (VCF) → ```results/vcf/```  
QC classification outputs → ```results/qc/```  
MultiQC summary report → ```results/multiqc/multiqc_report.html```  

## Technologies Used
- Nextflow (DSL2)
- Docker
- BWA-MEM
- samtools
- bcftools
- FastQC
- MultiQC

##Design Intent

This pipeline was designed to reflect core components of clinical NGS workflows:

- Structured ingestion of sequencing data
- Quality control at read and pipeline levels
- Deterministic alignment and variant calling
- Reproducible, containerized execution
- Aggregated QC reporting for downstream interpretation

## Why This Project Matters

This project demonstrates practical ability to:

- Design reproducible bioinformatics workflows
- Build modular Nextflow DSL2 pipelines
- Manage multi-step genomic data processing
- Integrate QC and variant analysis tools
- Structure clinical-style computational workflows

It reflects skills directly applicable to bioinformatics analyst roles in clinical genomics environments.


## Why This Project

This project demonstrates the ability to design and implement a reproducible bioinformatics pipeline using modern workflow tooling.

It reflects real-world clinical genomics workflows, including QC validation, alignment, and variant analysis.
