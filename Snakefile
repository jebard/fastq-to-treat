import pandas as pd
import os

configfile: "config.json"
localrules: all, mkdir

df = pd.read_csv(config["meta_file"], sep='\t', header=0, index_col=0)
sample_ids = list(df.index)
df.index = sample_ids

def get_pair_gz(sample_id):
    dir = config["raw_fastq_gz_dir"]
    return tuple(os.path.join(dir, df.loc[str(sample_id), x]) for x in ('ForwardFastqGZ', 'ReverseFastqGZ'))

def get_forward_primer(sample_id):
    return df.loc[sample_id]["Adapter_1"]

def get_reverse_primer(sample_id):
    return df.loc[sample_id]["Adapter_2"]

def get_gene_value(sample_id):
    return df.loc[sample_id]["gene"]

def get_template_fasta(sample_id):
    return df.loc[sample_id]["path_to_treat_template"]

def get_offset_value(sample_id):
    return df.loc[sample_id]["offset"]

def get_replicate_value(sample_id):
    return df.loc[sample_id]["replicate"]

def get_knockdown_gene(sample_id):
    return df.loc[sample_id]["knock_down"]

def get_tet_flag(sample_id):
    return df.loc[sample_id]["tetracycline"]

rule all:
    input:expand("{dir}/{sample_id}.fa", dir=config["dir_names"]["collapse_dir"],sample_id=sample_ids)
    run:
        for sample in sample_ids:
            gene = get_gene_value(sample)
            offset = get_offset_value(sample)
            template = get_template_fasta(sample)
            rep = get_replicate_value(sample)
            knock = get_knockdown_gene(sample)
            version = config["tool_version"]["treat"]
            if (get_tet_flag(sample)):
                os.system("./tools/treat/" + str(version) + "/treat load --sample " + sample + " --fasta outputs/collapse/" + sample + ".fa --gene " + gene +" --offset " + str(offset) + " --template "+template+" --replicate "+ str(rep) + " --knock-down " +knock+" --tet")
            else:
                os.system("./tools/treat/" + str(version) + "/treat load --sample " + sample + " --fasta outputs/collapse/" + sample + ".fa --gene " + gene +" --offset " + str(offset) + " --template "+template+" --replicate "+ str(rep) + " --knock-down " + knock)
                   
rule mkdir:
    output: touch(config["file_names"]["mkdir_done"])
    params: dirs = list(config["dir_names"].values())
    shell: "mkdir -p {params.dirs}"

rule unzip:
    input: 
        lambda wildcards: get_pair_gz(wildcards.sample_id),
        rules.mkdir.output
    output:
        config["dir_names"]["unzip_dir"] + "/{sample_id}_R1.fq",
        config["dir_names"]["unzip_dir"] + "/{sample_id}_R2.fq"
    shell:
        "gunzip -c {input[0]} > {output[0]} && gunzip -c {input[1]} > {output[1]}"

rule join:
    input: rules.unzip.output
    output: config["dir_names"]["join_dir"] + "/{sample_id}.assembled.fastq"
    version: config["tool_version"]["pear"]
    shell: "tools/pear/{version}/pear -f {input[0]} -r {input[1]} -o outputs/join/{wildcards.sample_id}"

rule filter:
    input: rules.join.output
    output: config["dir_names"]["filter_dir"] + "/{sample_id}.fq"
    version: config["tool_version"]["fastx"]
    params:
        percentage = config["parameters"]["quality_filtering"]["percentage"],
        qscore = config["parameters"]["quality_filtering"]["qscore"]
    shell: "tools/fastx/{version}/fastq_quality_filter -i {input} -o {output} -q {params.qscore} -p {params.percentage} -Q33 -v"

rule fq_2_fa:
    input: rules.filter.output
    output: config["dir_names"]["fq_2_fa_dir"] + "/{sample_id}.fa"
    version: config["tool_version"]["fastx"]
    shell: "tools/fastx/{version}/fastq_to_fasta -i {input} -o {output} -n -v -Q33"

rule trim:
    input: rules.fq_2_fa.output
    output: config["dir_names"]["trimmed_dir"] + "/{sample_id}.fa"
    version: config["tool_version"]["cutadapt"]
    params:
        adapter1=lambda wildcards: get_forward_primer(wildcards.sample_id),
        adapter2=lambda wildcards: get_reverse_primer(wildcards.sample_id)
    shell: "./tools/cutadapt/{version}/cutadapt/bin/cutadapt -m 15 -g {params.adapter1} -a {params.adapter2} -n 2 {input} > {output} 2>{output}.stats"

rule collapse:
    input: rules.trim.output
    output: config["dir_names"]["collapse_dir"] + "/{sample_id}.fa"
    version: config["tool_version"]["fastx"]
    shell: "./tools/fastx/{version}/fastx_collapser -i {input} -o {output} -v"

