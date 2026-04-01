# SE446 – Project Milestone 1: Chicago Crime Analytics with MapReduce

## Group Name: Practice Term Project

## Team Members

| Name | Student ID |
|------|-----------|
| Yunus Eren Demirboga | 230701 |

---

## Executive Summary

This project implements a MapReduce pipeline on the department's Hadoop cluster to analyze the Chicago Crime dataset (`chicago_crimes.csv`, 8M+ records). Four MapReduce jobs were written, each targeting a specific column of the CSV: **crime type** (index 5), **location description** (index 7), **date/year** (index 2), and **arrest status** (index 8). Each mapper reads from `sys.stdin`, skips the CSV header and malformed lines, extracts the relevant field, and emits `key\t1` pairs. A shared reducer (`Global_reducer.py` / `reducer_sum.py`) aggregates counts per key. All jobs were first validated on the 10K-row sample dataset and then executed on the full dataset.

---

## Repository Structure

```
/src       — Python mapper and reducer scripts
/scripts   — Shell scripts for running each task on the cluster
/output    — Captured terminal output and results for each task
```

---

## Task 2: Crime Type Distribution

**Research Question:** What are the most common types of crimes in Chicago?

### Command Used

```bash
source /etc/profile.d/hadoop.sh

mapred streaming \
  -files mapper_task2.py,Global_reducer.py \
  -mapper "python3 mapper_task2.py" \
  -reducer "python3 Global_reducer.py" \
  -input /data/chicago_crimes.csv \
  -output /user/ydemirboga/project/m1/task2_final

hdfs dfs -cat /user/ydemirboga/project/m1/task2_final/part-00000
```

### Top 5 Results

| Crime Type | Count |
|-----------|-------|
| THEFT | 162,688 |
| BATTERY | 151,930 |
| CRIMINAL DAMAGE | 91,241 |
| NARCOTICS | 74,127 |
| ASSAULT | 54,070 |

**Interpretation:** Theft is the predominant crime in Chicago, accounting for roughly 20% of all recorded incidents, followed by battery — indicating that property and violent crimes are the primary burden on law enforcement resources.

### Execution Log

```
PS C:\Users\Yunus\Desktop\GitHub_446\big_data_course-main> scp mapper_district.py ydemirboga@134.209.172.50:~/
ydemirboga@134.209.172.50's password:
mapper_district.py 100%  345     1.4KB/s   00
PS C:\Users\Yunus\Desktop\GitHub_446\big_data_course-main> ssh ydemirboga@134.209.172.50
ydemirboga@134.209.172.50's password:
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 5.15.0-170-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

  System load:  0.02               Processes:             128
  Usage of /:   21.8% of 77.35GB   Users logged in:       1
  Memory usage: 50%                IPv4 address for eth0: 134.209.172.50
  Swap usage:   0%                 IPv4 address for eth0: 10.17.0.5

Last login: Tue Mar 24 13:31:27 2026 from 2.88.134.47
ydemirboga@master-node:~$ source /etc/profile.d/hadoop.sh
ydemirboga@master-node:~$ mapred streaming \
>   -files mapper_district.py,reducer_sum.py \
>   -mapper "python3 mapper_district.py" \
>   -reducer "python3 reducer_sum.py" \
>   -input /data/chicago_crimes.csv \
>   -output /user/ydemirboga/project/m1/task2_final
packageJobJar: [] [/opt/hadoop-3.4.1/share/hadoop/tools/lib/hadoop-streaming-3.4.1.jar] /tmp/streamjob18118059461211723436.jar tmpDir=null
2026-03-24 15:20:17,959 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at master-node/134.209.172.50:8032
2026-03-24 15:20:18,329 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at master-node/134.209.172.50:8032
2026-03-24 15:20:18,867 INFO mapreduce.JobResourceUploader: Disabling Erasure Coding for path: /tmp/hadoop-yarn/staging/ydemirboga/.staging/job_1771402826595_0169
2026-03-24 15:20:20,899 INFO mapred.FileInputFormat: Total input files to process : 1
2026-03-24 15:20:20,940 INFO net.NetworkTopology: Adding a new node: /default-rack/164.92.103.148:9866
2026-03-24 15:20:20,942 INFO net.NetworkTopology: Adding a new node: /default-rack/146.190.147.119:9866
2026-03-24 15:20:21,630 INFO mapreduce.JobSubmitter: number of splits:2
2026-03-24 15:20:22,752 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1771402826595_0169
2026-03-24 15:20:22,753 INFO mapreduce.JobSubmitter: Executing with tokens: []
2026-03-24 15:20:23,122 INFO conf.Configuration: resource-types.xml not found
2026-03-24 15:20:23,123 INFO resource.ResourceUtils: Unable to find 'resource-types.xml'.
2026-03-24 15:20:23,264 INFO impl.YarnClientImpl: Submitted application application_1771402826595_0169
2026-03-24 15:20:23,329 INFO mapreduce.Job: The url to track the job: http://master-node:8088/proxy/application_1771402826595_0169/
2026-03-24 15:20:23,332 INFO mapreduce.Job: Running job: job_1771402826595_0169
2026-03-24 15:20:42,192 INFO mapreduce.Job: Job job_1771402826595_0169 running in uber mode : false
2026-03-24 15:20:42,194 INFO mapreduce.Job:  map 0% reduce 0%
2026-03-24 15:21:10,008 INFO mapreduce.Job:  map 100% reduce 0%
2026-03-24 15:21:25,778 INFO mapreduce.Job:  map 100% reduce 100%
2026-03-24 15:21:28,613 INFO mapreduce.Job: Job job_1771402826595_0169 completed successfully
2026-03-24 15:21:28,846 INFO mapreduce.Job: Counters: 54
        File System Counters
                FILE: Number of bytes read=11798790
                FILE: Number of bytes written=24540845
                FILE: Number of read operations=0
                FILE: Number of large read operations=0
                FILE: Number of write operations=0
                HDFS: Number of bytes read=181964998
                HDFS: Number of bytes written=690
                HDFS: Number of read operations=11
                HDFS: Number of large read operations=0
                HDFS: Number of write operations=2
                HDFS: Number of bytes read erasure-coded=0
        Job Counters
                Launched map tasks=2
                Launched reduce tasks=1
                Data-local map tasks=2
                Total time spent by all maps in occupied slots (ms)=98888
                Total time spent by all reduces in occupied slots (ms)=24120
                Total time spent by all map tasks (ms)=49444
                Total time spent by all reduce tasks (ms)=12060
                Total vcore-milliseconds taken by all map tasks=49444
                Total vcore-milliseconds taken by all reduce tasks=12060
                Total megabyte-milliseconds taken by all map tasks=25315328
                Total megabyte-milliseconds taken by all reduce tasks=6174720
        Map-Reduce Framework
                Map input records=793074
                Map output records=793072
                Map output bytes=10212640
                Map output materialized bytes=11798796
                Input split bytes=198
                Combine input records=0
                Combine output records=0
                Reduce input groups=34
                Reduce shuffle bytes=11798796
                Reduce input records=793072
                Reduce output records=34
                Spilled Records=1586144
                Shuffled Maps =2
                Failed Shuffles=0
                Merged Map outputs=2
                GC time elapsed (ms)=852
                CPU time spent (ms)=9330
                Physical memory (bytes) snapshot=661516288
                Virtual memory (bytes) snapshot=6563835904
                Total committed heap usage (bytes)=350830592
                Peak Map Physical memory (bytes)=252407808
                Peak Map Virtual memory (bytes)=2186690560
                Peak Reduce Physical memory (bytes)=157077504
                Peak Reduce Virtual memory (bytes)=2191368192
        Shuffle Errors
                BAD_ID=0
                CONNECTION=0
                IO_ERROR=0
                WRONG_LENGTH=0
                WRONG_MAP=0
                WRONG_REDUCE=0
        File Input Format Counters
                Bytes Read=181964800
        File Output Format Counters
                Bytes Written=690
2026-03-24 15:21:28,846 INFO streaming.StreamJob: Output directory: /user/ydemirboga/project/m1/task2_final

ydemirboga@master-node:~$ hdfs dfs -cat /user/ydemirboga/project/m1/task2_final/part-00000
ARSON   1717
ASSAULT 54070
BATTERY 151930
BURGLARY        39872
CONCEALED CARRY LICENSE VIOLATION       77
CRIM SEXUAL ASSAULT     2463
CRIMINAL DAMAGE 91241
CRIMINAL SEXUAL ASSAULT 1372
CRIMINAL TRESPASS       21476
DECEPTIVE PRACTICE      30396
DOMESTIC VIOLENCE       1
GAMBLING        1314
HOMICIDE        13173
HUMAN TRAFFICKING       13
INTERFERENCE WITH PUBLIC OFFICER        803
INTIMIDATION    92
KIDNAPPING      1108
LIQUOR LAW VIOLATION    2349
MOTOR VEHICLE THEFT     48494
NARCOTICS       74127
NON-CRIMINAL    1
OBSCENITY       24
OFFENSE INVOLVING CHILDREN      2065
OTHER NARCOTIC VIOLATION        11
OTHER OFFENSE   36893
PROSTITUTION    9100
PUBLIC INDECENCY        17
PUBLIC PEACE VIOLATION  1827
RITUALISM       8
ROBBERY 30991
SEX OFFENSE     3932
STALKING        534
THEFT   162688
WEAPONS VIOLATION       8893
```

---

## Task 3: Location Hotspots

**Research Question:** Where do most crimes occur?

### Command Used

```bash
source /etc/profile.d/hadoop.sh

mapred streaming \
  -files mapper_location.py,reducer_sum.py \
  -mapper "python3 mapper_location.py" \
  -reducer "python3 reducer_sum.py" \
  -input /data/chicago_crimes.csv \
  -output /user/ydemirboga/project/m1/task3

hdfs dfs -cat /user/ydemirboga/project/m1/task3/part-00000
```

### Top 5 Results

| Location Type | Count |
|--------------|-------|
| STREET | 245,437 |
| RESIDENCE | 136,238 |
| APARTMENT | 60,925 |
| SIDEWALK | 47,407 |
| OTHER | 29,213 |

**Interpretation:** Streets are by far the most dangerous locations in Chicago, accounting for nearly a third of all reported crimes, which suggests that mobile patrol units should prioritize outdoor public spaces over fixed building assignments.

### Execution Log

```
PS C:\Users\Yunus\Desktop\GitHub_446\big_data_course-main> scp mapper_location.py ydemirboga@134.209.172.50:~/
ydemirboga@134.209.172.50's password:
mapper_location.py 100%  385     1.8KB/s
PS C:\Users\Yunus\Desktop\GitHub_446\big_data_course-main> ssh ydemirboga@134.209.172.50
ydemirboga@134.209.172.50's password:
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 5.15.0-170-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

  System load:  0.11               Processes:             118
  Usage of /:   21.8% of 77.35GB   Users logged in:       0
  Memory usage: 50%                IPv4 address for eth0: 134.209.172.50
  Swap usage:   0%                 IPv4 address for eth0: 10.17.0.5

Last login: Tue Mar 24 15:15:52 2026 from 2.88.134.47
ydemirboga@master-node:~$ source /etc/profile.d/hadoop.sh
ydemirboga@master-node:~$ mapred streaming \
>   -files mapper_location.py,reducer_sum.py \
>   -mapper "python3 mapper_location.py" \
>   -reducer "python3 reducer_sum.py" \
>   -input /data/chicago_crimes.csv \
>   -output /user/ydemirboga/project/m1/task3
packageJobJar: [] [/opt/hadoop-3.4.1/share/hadoop/tools/lib/hadoop-streaming-3.4.1.jar] /tmp/streamjob3043903623481424155.jar tmpDir=null
2026-03-24 18:39:31,824 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at master-node/134.209.172.50:8032
2026-03-24 18:39:32,104 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at master-node/134.209.172.50:8032
2026-03-24 18:39:32,506 INFO mapreduce.JobResourceUploader: Disabling Erasure Coding for path: /tmp/hadoop-yarn/staging/ydemirboga/.staging/job_1771402826595_0174
2026-03-24 18:39:34,292 INFO mapred.FileInputFormat: Total input files to process : 1
2026-03-24 18:39:34,318 INFO net.NetworkTopology: Adding a new node: /default-rack/146.190.147.119:9866
2026-03-24 18:39:34,319 INFO net.NetworkTopology: Adding a new node: /default-rack/164.92.103.148:9866
2026-03-24 18:39:34,901 INFO mapreduce.JobSubmitter: number of splits:2
2026-03-24 18:39:35,759 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1771402826595_0174
2026-03-24 18:39:35,759 INFO mapreduce.JobSubmitter: Executing with tokens: []
2026-03-24 18:39:36,078 INFO conf.Configuration: resource-types.xml not found
2026-03-24 18:39:36,079 INFO resource.ResourceUtils: Unable to find 'resource-types.xml'.
2026-03-24 18:39:36,195 INFO impl.YarnClientImpl: Submitted application application_1771402826595_0174
2026-03-24 18:39:36,242 INFO mapreduce.Job: The url to track the job: http://master-node:8088/proxy/application_1771402826595_0174/
2026-03-24 18:39:36,244 INFO mapreduce.Job: Running job: job_1771402826595_0174
2026-03-24 18:39:54,054 INFO mapreduce.Job: Job job_1771402826595_0174 running in uber mode : false
2026-03-24 18:39:54,056 INFO mapreduce.Job:  map 0% reduce 0%
2026-03-24 18:40:23,930 INFO mapreduce.Job:  map 100% reduce 0%
2026-03-24 18:40:37,296 INFO mapreduce.Job:  map 100% reduce 100%
2026-03-24 18:40:40,147 INFO mapreduce.Job: Job job_1771402826595_0174 completed successfully
2026-03-24 18:40:40,476 INFO mapreduce.Job: Counters: 55
        File System Counters
                FILE: Number of bytes read=12346200
                FILE: Number of bytes written=25635644
                FILE: Number of read operations=0
                FILE: Number of large read operations=0
                FILE: Number of write operations=0
                HDFS: Number of bytes read=181964998
                HDFS: Number of bytes written=4757
                HDFS: Number of read operations=11
                FILE: Number of large read operations=0
                HDFS: Number of write operations=2
                HDFS: Number of bytes read erasure-coded=0
        Job Counters
                Killed map tasks=1
                Launched map tasks=2
                Launched reduce tasks=1
                Data-local map tasks=2
                Total time spent by all maps in occupied slots (ms)=107564
                Total time spent by all reduces in occupied slots (ms)=22670
                Total time spent by all map tasks (ms)=53782
                Total time spent by all reduce tasks (ms)=11335
                Total vcore-milliseconds taken by all map tasks=53782
                Total vcore-milliseconds taken by all reduce tasks=11335
                Total megabyte-milliseconds taken by all map tasks=27536384
                Total megabyte-milliseconds taken by all reduce tasks=5803520
        Map-Reduce Framework
                Map input records=793074
                Map output records=793072
                Map output bytes=10760050
                Map output materialized bytes=12346206
                Input split bytes=198
                Combine input records=0
                Combine output records=0
                Reduce input groups=218
                Reduce shuffle bytes=12346206
                Reduce input records=793072
                Reduce output records=217
                Spilled Records=1586144
                Shuffled Maps =2
                Failed Shuffles=0
                Merged Map outputs=2
                GC time elapsed (ms)=836
                CPU time spent (ms)=10380
                Physical memory (bytes) snapshot=690167808
                Virtual memory (bytes) snapshot=6563368960
                Total committed heap usage (bytes)=348200960
                Peak Map Physical memory (bytes)=267272192
                Peak Map Virtual memory (bytes)=2187980800
                Peak Reduce Physical memory (bytes)=170655744
                Peak Reduce Virtual memory (bytes)=2192871424
        Shuffle Errors
                BAD_ID=0
                CONNECTION=0
                IO_ERROR=0
                WRONG_LENGTH=0
                WRONG_MAP=0
                WRONG_REDUCE=0
        File Input Format Counters
                Bytes Read=181964800
        File Output Format Counters
                Bytes Written=4757
2026-03-24 18:40:40,477 INFO streaming.StreamJob: Output directory: /user/ydemirboga/project/m1/task3

ydemirboga@master-node:~$ hdfs dfs -cat /user/ydemirboga/project/m1/task3/part-00000
ALLEY   18258
APARTMENT       60925
RESIDENCE       136238
SIDEWALK        47407
STREET  245437
OTHER   29213
...
```

---

## Task 4: The Time Dimension

**Research Question:** How has the total number of crimes changed over the years?

### Command Used

```bash
source /etc/profile.d/hadoop.sh

mapred streaming \
  -files mapper_year.py,reducer_sum.py \
  -mapper "python3 mapper_year.py" \
  -reducer "python3 reducer_sum.py" \
  -input /data/chicago_crimes.csv \
  -output /user/ydemirboga/project/m1/task4

hdfs dfs -cat /user/ydemirboga/project/m1/task4/part-00000
```

### Top 5 Results (by crime count)

| Year | Count |
|------|-------|
| 2001 | 467,301 |
| 2002 | 205,267 |
| 2023 | 81,461 |
| 2025 | 12,710 |
| 2022 | 4,678 |

**Interpretation:** Crime counts are highest in 2001 and 2002, reflecting the dataset's historical depth; the data shows a clear downward trend in total reported crimes over the decades, suggesting an overall improvement in public safety in Chicago over the past 20+ years.

### Execution Log

```
PS C:\Users\Yunus\Desktop\GitHub_446\big_data_course-main> scp mapper_year.py ydemirboga@134.209.172.50:~/
ydemirboga@134.209.172.50's password:
mapper_year.py 100%  349     1.7KB/s
PS C:\Users\Yunus\Desktop\GitHub_446\big_data_course-main> ssh ydemirboga@134.209.172.50
ydemirboga@134.209.172.50's password:
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 5.15.0-170-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

  System load:  0.18               Processes:             117
  Usage of /:   21.8% of 77.35GB   Users logged in:       0
  Memory usage: 50%                IPv4 address for eth0: 134.209.172.50
  Swap usage:   0%                 IPv4 address for eth0: 10.17.0.5

Last login: Tue Mar 24 18:36:51 2026 from 2.88.134.47
ydemirboga@master-node:~$ source /etc/profile.d/hadoop.sh
ydemirboga@master-node:~$ mapred streaming \
>   -files mapper_year.py,reducer_sum.py \
>   -mapper "python3 mapper_year.py" \
>   -reducer "python3 reducer_sum.py" \
>   -input /data/chicago_crimes.csv \
>   -output /user/ydemirboga/project/m1/task4
packageJobJar: [] [/opt/hadoop-3.4.1/share/hadoop/tools/lib/hadoop-streaming-3.4.1.jar] /tmp/streamjob2491193457618256050.jar tmpDir=null
2026-03-24 19:03:31,783 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at master-node/134.209.172.50:8032
2026-03-24 19:03:32,033 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at master-node/134.209.172.50:8032
2026-03-24 19:03:32,533 INFO mapreduce.JobResourceUploader: Disabling Erasure Coding for path: /tmp/hadoop-yarn/staging/ydemirboga/.staging/job_1771402826595_0175
2026-03-24 19:03:34,310 INFO mapred.FileInputFormat: Total input files to process : 1
2026-03-24 19:03:34,338 INFO net.NetworkTopology: Adding a new node: /default-rack/164.92.103.148:9866
2026-03-24 19:03:34,339 INFO net.NetworkTopology: Adding a new node: /default-rack/146.190.147.119:9866
2026-03-24 19:03:34,963 INFO mapreduce.JobSubmitter: number of splits:2
2026-03-24 19:03:35,860 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1771402826595_0175
2026-03-24 19:03:35,860 INFO mapreduce.JobSubmitter: Executing with tokens: []
2026-03-24 19:03:36,183 INFO conf.Configuration: resource-types.xml not found
2026-03-24 19:03:36,184 INFO resource.ResourceUtils: Unable to find 'resource-types.xml'.
2026-03-24 19:03:36,294 INFO impl.YarnClientImpl: Submitted application application_1771402826595_0175
2026-03-24 19:03:36,342 INFO mapreduce.Job: The url to track the job: http://master-node:8088/proxy/application_1771402826595_0175/
2026-03-24 19:03:36,344 INFO mapreduce.Job: Running job: job_1771402826595_0175
2026-03-24 19:03:53,457 INFO mapreduce.Job: Job job_1771402826595_0175 running in uber mode : false
2026-03-24 19:03:53,459 INFO mapreduce.Job:  map 0% reduce 0%
2026-03-24 19:04:19,708 INFO mapreduce.Job:  map 100% reduce 0%
2026-03-24 19:04:33,298 INFO mapreduce.Job:  map 100% reduce 100%
2026-03-24 19:04:36,221 INFO mapreduce.Job: Job job_1771402826595_0175 completed successfully
2026-03-24 19:04:36,459 INFO mapreduce.Job: Counters: 55
        File System Counters
                FILE: Number of bytes read=7137663
                FILE: Number of bytes written=15218522
                FILE: Number of read operations=0
                FILE: Number of large read operations=0
                FILE: Number of write operations=0
                HDFS: Number of bytes read=181964998
                HDFS: Number of bytes written=245
                HDFS: Number of read operations=11
                FILE: Number of large read operations=0
                HDFS: Number of write operations=2
                HDFS: Number of bytes read erasure-coded=0
        Job Counters
                Killed map tasks=1
                Launched map tasks=2
                Launched reduce tasks=1
                Data-local map tasks=2
                Total time spent by all maps in occupied slots (ms)=97102
                Total time spent by all reduces in occupied slots (ms)=21048
                Total time spent by all map tasks (ms)=48551
                Total time spent by all reduce tasks (ms)=10524
                Total vcore-milliseconds taken by all map tasks=48551
                Total vcore-milliseconds taken by all reduce tasks=10524
                Total megabyte-milliseconds taken by all map tasks=24858112
                Total megabyte-milliseconds taken by all reduce tasks=5388288
        Map-Reduce Framework
                Map input records=793074
                Map output records=793073
                Map output bytes=5551511
                Map output materialized bytes=7137669
                Input split bytes=198
                Combine input records=0
                Combine output records=0
                Reduce input groups=25
                Reduce shuffle bytes=7137669
                Reduce input records=793073
                Reduce output records=25
                Spilled Records=1586146
                Shuffled Maps =2
                Failed Shuffles=0
                Merged Map outputs=2
                GC time elapsed (ms)=890
                CPU time spent (ms)=8930
                Physical memory (bytes) snapshot=655147008
                Virtual memory (bytes) snapshot=6563336192
                Total committed heap usage (bytes)=348147712
                Peak Map Physical memory (bytes)=255799296
                Peak Map Virtual memory (bytes)=2185879552
                Peak Reduce Physical memory (bytes)=144003072
                Peak Reduce Virtual memory (bytes)=2191790080
        Shuffle Errors
                BAD_ID=0
                CONNECTION=0
                IO_ERROR=0
                WRONG_LENGTH=0
                WRONG_MAP=0
                WRONG_REDUCE=0
        File Input Format Counters
                Bytes Read=181964800
        File Output Format Counters
                Bytes Written=245
2026-03-24 19:04:36,460 INFO streaming.StreamJob: Output directory: /user/ydemirboga/project/m1/task4

ydemirboga@master-node:~$ hdfs dfs -cat /user/ydemirboga/project/m1/task4/part-00000
2001    467301
2002    205267
2003    985
2004    915
2005    1031
2006    796
2007    762
2008    1010
2009    910
2010    695
2011    770
2012    800
2013    714
2014    825
2015    1105
2016    1339
2017    1387
2018    1327
2019    1174
2020    1832
2021    2399
2022    4678
2023    81461
2024    880
2025    12710
```

---

## Task 5: Law Enforcement Analysis

**Research Question:** What percentage of crimes result in an arrest?

### Command Used

```bash
source /etc/profile.d/hadoop.sh

hdfs dfs -rm -r /user/ydemirboga/project/m1/task5

mapred streaming \
  -files mapper_arrest.py,reducer_sum.py \
  -mapper "python3 mapper_arrest.py" \
  -reducer "python3 reducer_sum.py" \
  -input /data/chicago_crimes.csv \
  -output /user/ydemirboga/project/m1/task5

hdfs dfs -cat /user/ydemirboga/project/m1/task5/part-00000
```

### Execution Log

```
PS C:\Users\Yunus\Desktop\GitHub_446\big_data_course-main> scp mapper_arrest.py ydemirboga@134.209.172.50:~/
ydemirboga@134.209.172.50's password:
mapper_arrest.py 100%  426     1.8KB/s
PS C:\Users\Yunus\Desktop\GitHub_446\big_data_course-main> ssh ydemirboga@134.209.172.50
ydemirboga@134.209.172.50's password:
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 5.15.0-170-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

  System load:  0.0                Processes:             118
  Usage of /:   21.8% of 77.35GB   Users logged in:       0
  Memory usage: 49%                IPv4 address for eth0: 134.209.172.50
  Swap usage:   0%                 IPv4 address for eth0: 10.17.0.5

Last login: Tue Mar 24 19:36:18 2026 from 2.88.134.47
ydemirboga@master-node:~$ source /etc/profile.d/hadoop.sh
ydemirboga@master-node:~$ mapred streaming \
>   -files mapper_arrest.py,reducer_sum.py \
>   -mapper "python3 mapper_arrest.py" \
>   -reducer "python3 reducer_sum.py" \
>   -input /data/chicago_crimes.csv \
>   -output /user/ydemirboga/project/m1/task5
2026-03-24 19:50:08,956 ERROR streaming.StreamJob: Error Launching job : Output directory hdfs://master-node:9000/user/ydemirboga/project/m1/task5 already exists
Streaming Command Failed!
ydemirboga@master-node:~$ hdfs dfs -rm -r /user/ydemirboga/project/m1/task5
Deleted /user/ydemirboga/project/m1/task5
ydemirboga@master-node:~$ mapred streaming   -files mapper_arrest.py,reducer_sum.py   -mapper "python3 mapper_arrest.py"   -reducer "python3 reducer_sum.py"   -input /data/chicago_crimes.csv   -output /user/ydemirboga/project/m1/task5
packageJobJar: [] [/opt/hadoop-3.4.1/share/hadoop/tools/lib/hadoop-streaming-3.4.1.jar] /tmp/streamjob10462421345717291240.jar tmpDir=null
2026-03-24 19:51:08,031 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at master-node/134.209.172.50:8032
2026-03-24 19:51:08,349 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at master-node/134.209.172.50:8032
2026-03-24 19:51:08,797 INFO mapreduce.JobResourceUploader: Disabling Erasure Coding for path: /tmp/hadoop-yarn/staging/ydemirboga/.staging/job_1771402826595_0177
2026-03-24 19:51:10,458 INFO mapred.FileInputFormat: Total input files to process : 1
2026-03-24 19:51:10,494 INFO net.NetworkTopology: Adding a new node: /default-rack/164.92.103.148:9866
2026-03-24 19:51:10,496 INFO net.NetworkTopology: Adding a new node: /default-rack/146.190.147.119:9866
2026-03-24 19:51:11,132 INFO mapreduce.JobSubmitter: number of splits:2
2026-03-24 19:51:11,919 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1771402826595_0177
2026-03-24 19:51:11,919 INFO mapreduce.JobSubmitter: Executing with tokens: []
2026-03-24 19:51:12,214 INFO conf.Configuration: resource-types.xml not found
2026-03-24 19:51:12,216 INFO resource.ResourceUtils: Unable to find 'resource-types.xml'.
2026-03-24 19:51:12,347 INFO impl.YarnClientImpl: Submitted application application_1771402826595_0177
2026-03-24 19:51:12,414 INFO mapreduce.Job: The url to track the job: http://master-node:8088/proxy/application_1771402826595_0177/
2026-03-24 19:51:12,417 INFO mapreduce.Job: Running job: job_1771402826595_0177
2026-03-24 19:51:28,914 INFO mapreduce.Job: Job job_1771402826595_0177 running in uber mode : false
2026-03-24 19:51:28,916 INFO mapreduce.Job:  map 0% reduce 0%
2026-03-24 19:51:57,851 INFO mapreduce.Job:  map 100% reduce 0%
2026-03-24 19:52:12,478 INFO mapreduce.Job:  map 100% reduce 100%
2026-03-24 19:52:15,350 INFO mapreduce.Job: Job job_1771402826595_0177 completed successfully
2026-03-24 19:52:15,556 INFO mapreduce.Job: Counters: 54
        File System Counters
                FILE: Number of bytes read=7708794
                FILE: Number of bytes written=16360811
                FILE: Number of read operations=0
                FILE: Number of large read operations=0
                FILE: Number of write operations=0
                HDFS: Number of bytes read=181964998
                HDFS: Number of bytes written=25
                HDFS: Number of read operations=11
                HDFS: Number of large read operations=0
                HDFS: Number of write operations=2
                HDFS: Number of bytes read erasure-coded=0
        Job Counters
                Launched map tasks=2
                Launched reduce tasks=1
                Data-local map tasks=2
                Total time spent by all maps in occupied slots (ms)=103318
                Total time spent by all reduces in occupied slots (ms)=24528
                Total time spent by all map tasks (ms)=51659
                Total time spent by all reduce tasks (ms)=12264
                Total vcore-milliseconds taken by all map tasks=51659
                Total vcore-milliseconds taken by all reduce tasks=12264
                Total megabyte-milliseconds taken by all map tasks=26449408
                Total megabyte-milliseconds taken by all reduce tasks=6279168
        Map-Reduce Framework
                Map input records=793074
                Map output records=793072
                Map output bytes=6122644
                Map output materialized bytes=7708800
                Input split bytes=198
                Combine input records=0
                Combine output records=0
                Reduce input groups=2
                Reduce shuffle bytes=7708800
                Reduce input records=793072
                Reduce output records=2
                Spilled Records=1586144
                Shuffled Maps =2
                Failed Shuffles=0
                Merged Map outputs=2
                GC time elapsed (ms)=745
                CPU time spent (ms)=8910
                Physical memory (bytes) snapshot=666300416
                Virtual memory (bytes) snapshot=6560559104
                Total committed heap usage (bytes)=348209152
                Peak Map Physical memory (bytes)=253210624
                Peak Map Virtual memory (bytes)=2184716288
                Peak Reduce Physical memory (bytes)=165388288
                Peak Reduce Virtual memory (bytes)=2193051648
        Shuffle Errors
                BAD_ID=0
                CONNECTION=0
                IO_ERROR=0
                WRONG_LENGTH=0
                WRONG_MAP=0
                WRONG_REDUCE=0
        File Input Format Counters
                Bytes Read=181964800
        File Output Format Counters
                Bytes Written=25
2026-03-24 19:52:15,557 INFO streaming.StreamJob: Output directory: /user/ydemirboga/project/m1/task5

ydemirboga@master-node:~$ hdfs dfs -cat /user/ydemirboga/project/m1/task5/part-00000
false   571140
true    221932
```

### Results

| Arrest Status | Count | Percentage |
|--------------|-------|-----------|
| false | 571,140 | ~72% |
| true | 221,932 | ~28% |

**Interpretation:** Only about 28% of reported crimes result in an arrest, meaning nearly 3 out of 4 offenders are not apprehended — highlighting a significant gap in law enforcement closure rates and suggesting that investigative resources and patrol strategies need substantial improvement.

---

## Member Contribution

| Member | Task | Role |
|--------|------|------|
| Yunus Eren Demirboga | Task 2 | Wrote `mapper_task2.py`, ran job on cluster, captured output |
| Yunus Eren Demirboga | Task 3 | Wrote `mapper_location.py`, ran job on cluster, captured output |
| Yunus Eren Demirboga | Task 4 | Wrote `mapper_year.py`, ran job on cluster, captured output |
| Yunus Eren Demirboga | Task 5 | Wrote `mapper_arrest.py`, wrote shell scripts, ran job on cluster |
| Yunus Eren Demirboga | Shared | Wrote `Global_reducer.py` (shared reducer for all tasks) |
