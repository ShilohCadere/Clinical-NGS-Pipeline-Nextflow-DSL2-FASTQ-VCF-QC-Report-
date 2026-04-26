#!/bin/bash -ue
echo "QC for sample" > sample_qc.txt
wc -l sample.vcf >> sample_qc.txt
