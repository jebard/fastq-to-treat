#!/bin/sh
# properties = {"type": "single", "rule": "collapse", "local": false, "input": ["outputs/trimmed/COIII_3B_MRB7260_mintet2.fa"], "output": ["outputs/collapse/COIII_3B_MRB7260_mintet2.fa"], "wildcards": {"sample_id": "COIII_3B_MRB7260_mintet2"}, "params": {}, "log": [], "threads": 1, "resources": {}, "jobid": 10, "cluster": {"cluster": "faculty", "partition": "gbc", "qos": "gbc", "time": "00:30:00", "nodes": 1, "ntasks-per-node": 1}}
cd /projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv && \
/projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv/bin/python3 \
-m snakemake outputs/collapse/COIII_3B_MRB7260_mintet2.fa --snakefile /projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv/Snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv/.snakemake/tmp.4bc9onub outputs/trimmed/COIII_3B_MRB7260_mintet2.fa --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
  -p --allowed-rules collapse --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch "/projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv/.snakemake/tmp.4bc9onub/10.jobfinished" || (touch "/projects/academic/lread/core-sequencing-runs/treat-scripting/development/treat-virtualenv/.snakemake/tmp.4bc9onub/10.jobfailed"; exit 1)

