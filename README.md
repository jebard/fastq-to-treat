<h1># fastq-to-treat</h1>
Handles the preprocessing from illumina fastq files through TREAT using SnakeMake

1. Navigate to the new flowcell data output.

2. git clone this repository 

    `git clone https://github.com/jebard/fastq-to-treat.git`

3. Activate the python anaconda environment (testing on CCR 11-21-19)

    `source fastq-to-treat/bin/activate` 

4. Edit the config.json file and cluster.json files


5. Ensure meta-data table contains all of the necessairy fields (TABBED-DELIMITED:

    `Sample gene  offset  tetracycline knock_down  replicate Adapter_1 Adapter_2 path_to_treat_template  ForwardFastqGZ  ReverseFastqGZ`

Example : 

    `A6_3B_alenaSM_2 A63B    25      FALSE   alenaSM 2  GAAAACACCCATTTTTAGGAGG  GGAGTTATAGAATAAGATCAAATAAG  projects/academic/lread/gene-templates/A63B.fasta A6_3B_alenaSM_2_S20_R1_001.fastq.gz  A6_3B_alenaSM_2_S20_R2_001.fastq.gz`

** NOTE EXACT HEADERS HAVE TO BE ENFORCED or key errors will be thrown during processing**


6. Launch jobs

  The pipeline will utilize CCR resource to parallel execution.
  OTU table and statisics about merge rate, filter rate, hit rate wiil be placed under _table_

### The use of --latency-wait allows for SLURM to catch up writing the files and posting the file handles so Snakemake can see them.

    `snakemake --latency-wait 120 -p -j 100 --cluster-config cluster.json --cluster "sbatch --partition gbc --cluster faculty --qos gbc --account gbcstaff"`


7. Pipeline should result in a treat.db file -- proceed with treat normalization process.

8. Copy over the resulting treat.db file onto your local machine, or a machine that can launch a treat web browser.

9. Run treat.exe --db server (or equivalent command found https://github.com/ubccr/treat)

To launch treat with updated DB
Copy the new .database file into /lread/dbs

Check treats status

10. systemctl status treat 

Stop the treat service

11. sudo systemctl stop treat

Should show treat as stopped

12. sudo systemctl status treat 

Restart the treat service

13. sudo systemctl start treat

* NOTE:  this will start treat up and will take some time to load.

To monitor the service

14. sudo journalctl -f -u treat
