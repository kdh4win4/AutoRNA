# AutoRNA 🧬
A minimal MLOps-style RNA-Seq pipeline prototype (QC-only version)

## Overview
AutoRNA is a lightweight and modular workflow that automates the early stage of bulk RNA-Seq processing.  
This version performs quality control and trimming using `fastp`, wrapped in a reproducible Conda + Snakemake environment.

## Features
- Conda-managed environment
- Snakemake workflow orchestration
- FASTQ quality control and trimming via fastp
- Organized output directory structure

## Input
Place raw FASTQ files in:
```
data/raw/{sample}.fastq.gz
```

Define sample names in `config.yaml`, e.g.:
```yaml
samples:
  - sample1
```

## Output
After running the workflow you will obtain:
```
data/qc/<sample>_fastp.html       # HTML QC report
data/qc/<sample>_fastp.json       # JSON QC metrics
data/qc/<sample>_trimmed.fastq.gz # trimmed FASTQ
logs/fastp_<sample>.log           # log file
```

## Install the Environment
```
conda env create -f environment.yml
conda activate autorna
```

## Run the Pipeline
```
snakemake --cores 1 -s pipeline/Snakefile
```

## Repository Structure
```
AutoRNA/
├── environment.yml
├── config.yaml
├── pipeline/
│   ├── Snakefile
│   └── rules/
│       └── qc.smk
├── data/
│   └── raw/
└── logs/
```

## Roadmap
- [x] QC with fastp
- [ ] STAR alignment
- [ ] Gene quantification
- [ ] Differential expression (edgeR/limma)
- [ ] Streamlit/FastAPI frontend
- [ ] CI/CD automation
