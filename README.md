# Clinical NGS Pipeline (Nextflow DSL2 + Docker)

**Shiloh Cadere**  
Bioinformatics Analyst | Clinical NGS Pipelines | Python • R • SQL  


## Recruiter Summary (READ THIS FIRST)

A production-style **Nextflow DSL2 bioinformatics pipeline** that processes paired-end NGS data from FASTQ to variant calls with automated QC, alignment, and reporting.

Designed to simulate **clinical genomics workflows used in regulated sequencing environments**, emphasizing reproducibility, modular workflow design, and scalable bioinformatics processing.


## What This Project Demonstrates

This project reflects real-world bioinformatics engineering capability in:

- Building modular **Nextflow DSL2 pipelines**
- Designing reproducible workflows using **Docker**
- Processing paired-end NGS sequencing data (FASTQ → VCF)
- Implementing clinical-style QC → Alignment → Variant Calling workflows
- Integrating multi-tool bioinformatics pipelines
- Producing aggregated QC reports using **MultiQC**


## Pipeline Architecture

```
FASTQ INPUTS
     │
     ▼
FastQC (Read Quality Control)
     │
     ▼
BWA-MEM (Read Alignment)
     │
     ▼
samtools (Sorting + Indexing BAM)
     │
     ▼
bcftools (Variant Calling)
     │
     ▼
QC Classification
     │
     ▼
MultiQC (Aggregated Reporting)
```

## Key Features
- Modular Nextflow DSL2 pipeline architecture
- Fully containerized execution (Docker)
- Paired-end FASTQ processing
- Automated QC generation and aggregation
- Variant calling using bcftools
- Sample-sheet driven workflow inputs
- Reproducible, production-style pipeline design

## Inputs
### Samplesheet (CSV)
```
sample,fastq_1,fastq_2
sample1,data/sample_1.fastq.gz,data/sample_2.fastq.gz
```

### Reference Genome
```
data/reference.fasta
```

## Execution
1. Build container
```docker build -t ngs-pipeline:1.0 .```

2. Run pipeline
```nextflow run main.nf \
  -profile docker \
  --samplesheet data/samplesheet.csv \
  --ref data/reference.fasta
```

## Outputs
- FastQC reports (per-sample QC)
- Sorted + indexed BAM files
- VCF variant calls
- QC classification summaries
- MultiQC aggregated report

## Technologies Used

Nextflow (DSL2) • Docker • BWA-MEM • samtools • bcftools • FastQC • MultiQC

## Design Intent

This pipeline was designed to reflect core components of clinical NGS workflows, including:

- Structured ingestion of sequencing data
- Deterministic alignment and variant calling
- Quality control at both read and pipeline levels
- Reproducible containerized execution
- Aggregated QC reporting for downstream interpretation 

## Why This Project Matters

This project demonstrates the ability to design and implement **reproducible, production-style bioinformatics workflows** used in clinical and research genomics environments.

It reflects real pipeline patterns used in:

- sequencing QC validation
- variant discovery workflows
- scalable genomic data processing systems

## Portfolio Value Statement

This project demonstrates end-to-end capability in building clinical-grade bioinformatics pipelines, bridging raw sequencing data to interpretable genomic outputs using modern workflow engineering practices.

## Author

### Shiloh Cadere
### Bioinformatics Analyst specializing in clinical NGS pipelines and reproducible workflow systems
### Python • R • SQL • Nextflow • Docker
