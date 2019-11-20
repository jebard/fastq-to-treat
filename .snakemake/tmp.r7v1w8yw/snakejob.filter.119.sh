#!/bin/sh
# properties = {"type": "single", "rule": "filter", "local": false, "input": ["outputs/join/ND8_3B_MRB7260_plustet1.assembled.fastq"], "output": ["outputs/filter/ND8_3B_MRB7260_plustet1.fq"], "wildcards": {"sample_id": "ND8_3B_MRB7260_plustet1"}, "params": {"percentage": "90", "qscore": "30"}, "log": [], "threads": 1, "resources": {}, "jobid": 119, "cluster": {"cluster": "faculty", "partition": "gbc", "qos": "gbc", "time": "00:30:00", "nodes": 1, "ntasks-per-node": 1}}
cd /projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv && \
/projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv/bin/python3 \
-m snakemake outputs/filter/ND8_3B_MRB7260_plustet1.fq --snakefile /projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv/Snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv/.snakemake/tmp.r7v1w8yw outputs/join/ND8_3B_MRB7260_plustet1.assembled.fastq --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
  -p --allowed-rules filter --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch "/projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv/.snakemake/tmp.r7v1w8yw/119.jobfinished" || (touch "/projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv/.snakemake/tmp.r7v1w8yw/119.jobfailed"; exit 1)

