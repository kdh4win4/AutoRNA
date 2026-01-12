# fastp quality control rule

rule fastp_qc:
    input:
        "data/raw/{sample}.fastq.gz"
    output:
        html   = "data/qc/{sample}_fastp.html",
        json   = "data/qc/{sample}_fastp.json",
        fq_out = "data/qc/{sample}_trimmed.fastq.gz"
    log:
        "logs/fastp_{sample}.log"
    shell:
        """
        mkdir -p data/qc logs
        fastp \
          -i {input} \
          -o {output.fq_out} \
          -h {output.html} \
          -j {output.json} \
          > {log} 2>&1
        """
