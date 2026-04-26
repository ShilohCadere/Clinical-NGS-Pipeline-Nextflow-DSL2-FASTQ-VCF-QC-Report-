#!/bin/bash -ue
mkdir -p fastqc
fastqc -o fastqc sample_1.fastq.gz sample_2.fastq.gz
