# STAR alignment rule
# NOTE: requires STAR genome index in config.yaml (reference.star_index)

rule star_align:
    input:
        "data/qc/{sample}_trimmed.fastq.gz"
    output:
        "data/aligned/{sample}.bam"
    params:
        star_index = config["reference"]["star_index"]
    log:
        "logs/star_{sample}.log"
    threads: 4
    shell:
        """
        mkdir -p data/aligned

        STAR \
          --runThreadN {threads} \
          --genomeDir {params.star_index} \
          --readFilesIn {input} \
          --readFilesCommand zcat \
          --outSAMtype BAM SortedByCoordinate \
          --outFileNamePrefix temp_{wildcards.sample}_ \
          > {log} 2>&1

        mv temp_{wildcards.sample}_Aligned.sortedByCoord.out.bam {output}
        """
