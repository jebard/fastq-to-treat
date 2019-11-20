#!/bin/sh
# properties = {"type": "single", "rule": "fq_2_fa", "local": false, "input": ["outputs/filter/CR4_3B_MRB7260_mintet1.fq"], "output": ["outputs/fq_2_fa/CR4_3B_MRB7260_mintet1.fa"], "wildcards": {"sample_id": "CR4_3B_MRB7260_mintet1"}, "params": {}, "log": [], "threads": 1, "resources": {}, "jobid": 81, "cluster": {"cluster": "faculty", "partition": "gbc", "qos": "gbc", "time": "00:30:00", "nodes": 1, "ntasks-per-node": 1}}
cd /projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv && \
/projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv/bin/python3 \
-m snakemake outputs/fq_2_fa/CR4_3B_MRB7260_mintet1.fa --snakefile /projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv/Snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv/.snakemake/tmp.r7v1w8yw outputs/filter/CR4_3B_MRB7260_mintet1.fq --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
  -p --allowed-rules fq_2_fa --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch "/projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv/.snakemake/tmp.r7v1w8yw/81.jobfinished" || (touch "/projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv/.snakemake/tmp.r7v1w8yw/81.jobfailed"; exit 1)

