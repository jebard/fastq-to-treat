#!/bin/sh
# properties = {"type": "single", "rule": "unzip", "local": false, "input": ["../C9K8C/fastq/RPS12_REH1_mintet1_S25_L001_R1_001.fastq.gz", "../C9K8C/fastq/RPS12_REH1_mintet1_S25_L001_R2_001.fastq.gz", "mkdir.done"], "output": ["outputs/unzip/RPS12_REH1_mintet1_R1.fq", "outputs/unzip/RPS12_REH1_mintet1_R2.fq"], "wildcards": {"sample_id": "RPS12_REH1_mintet1"}, "params": {}, "log": [], "threads": 1, "resources": {}, "jobid": 221, "cluster": {"cluster": "faculty", "partition": "gbc", "qos": "gbc", "time": "00:30:00", "nodes": 1, "ntasks-per-node": 1}}
cd /projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv && \
/projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv/bin/python3 \
-m snakemake outputs/unzip/RPS12_REH1_mintet1_R1.fq --snakefile /projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv/Snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv/.snakemake/tmp.x03texoh ../C9K8C/fastq/RPS12_REH1_mintet1_S25_L001_R1_001.fastq.gz ../C9K8C/fastq/RPS12_REH1_mintet1_S25_L001_R2_001.fastq.gz mkdir.done --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
  -p --allowed-rules unzip --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch "/projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv/.snakemake/tmp.x03texoh/221.jobfinished" || (touch "/projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv/.snakemake/tmp.x03texoh/221.jobfailed"; exit 1)

