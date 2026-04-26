#!/bin/bash -ue
samtools view -Sb sample.sam | samtools sort -o sample.sorted.bam
samtools index sample.sorted.bam
