#!/bin/bash -ue
bwa index reference.fasta 2>/dev/null || true
bwa mem reference.fasta sample_1.fastq.gz sample_2.fastq.gz > sample.sam
