# clinical-ngs-pipeline

# Clinical NGS Pipeline (Nextflow + Docker)

Reproducible end-to-end bioinformatics pipeline for processing paired-end sequencing data through QC, alignment, variant calling, and reporting.

Built using Nextflow DSL2 and fully containerized with Docker.

## Pipeline Overview

FASTQ → FastQC → BWA-MEM → Sorted BAM → Variant Calling → QC Classification → MultiQC Report

## Quick Start

```bash
docker build -t ngs-pipeline:1.0 .

nextflow run main.nf \
  --reads "data/*_{1,2}.fastq.gz" \
  --ref data/reference.fasta \
  -with-docker ngs-pipeline:1.0
```

## Key Features

- Modular Nextflow DSL2 pipeline design
- Fully containerized for reproducibility
- Supports paired-end FASTQ processing
- Integrated QC reporting with MultiQC
- Custom variant-based QC classification

## Outputs

- FastQC reports
- Sorted BAM files
- VCF variant files
- QC classification summaries
- MultiQC aggregated report

## Why This Project

This project demonstrates the ability to design and implement a reproducible bioinformatics pipeline using modern workflow tooling.

It reflects real-world clinical genomics workflows, including QC validation, alignment, and variant analysis.
