# AutoRNA 🧬

**AutoRNA** is a minimal, MLOps-style RNA-Seq pipeline prototype.

현재 단계 (v0.1):

- Conda 환경 (`environment.yml`)
- Snakemake 기반 QC 파이프라인
- `fastp`를 이용한 FASTQ 품질 평가 및 trimming

---

## Pipeline Overview (QC 단계)

입력:

- `data/raw/{sample}.fastq.gz`

출력:

- `data/qc/{sample}_fastp.html` – fastp HTML QC report
- `data/qc/{sample}_fastp.json` – fastp JSON summary
- `data/qc/{sample}_trimmed.fastq.gz` – trimmed reads
- `logs/fastp_{sample}.log` – 로그 파일

---

## Quick Start

```bash
conda env create -f environment.yml
conda activate autorna
snakemake --cores 1 -s pipeline/Snakefile
