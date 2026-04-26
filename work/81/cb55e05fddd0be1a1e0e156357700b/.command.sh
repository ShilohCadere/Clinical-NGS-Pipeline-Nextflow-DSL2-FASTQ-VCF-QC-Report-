#!/bin/bash -ue
bcftools mpileup -f reference.fasta -Ou sample.sorted.bam | bcftools call -mv -Ov -o sample.vcf
