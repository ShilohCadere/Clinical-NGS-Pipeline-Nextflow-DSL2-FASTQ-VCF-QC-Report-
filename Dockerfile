FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    git \
    build-essential \
    openjdk-11-jre \
    bwa \
    samtools \
    bcftools \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install FastQC manually (IMPORTANT FIX)
RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.12.1.zip \
    && unzip fastqc_v0.12.1.zip \
    && chmod +x FastQC/fastqc \
    && ln -s /FastQC/fastqc /usr/local/bin/fastqc

# MultiQC
RUN apt-get update && apt-get install -y python3 python3-pip \
    && pip3 install multiqc

WORKDIR /pipeline