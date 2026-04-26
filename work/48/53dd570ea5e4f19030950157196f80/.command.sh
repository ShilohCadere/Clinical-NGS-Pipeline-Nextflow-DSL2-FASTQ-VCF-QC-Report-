#!/bin/bash -ue
bwa mem reference.fasta sample_1.fastq.gz sample_2.fastq.gz > sample.sam
