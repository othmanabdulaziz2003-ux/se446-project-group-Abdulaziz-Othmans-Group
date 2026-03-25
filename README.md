# se446-project-group-Abdulaziz-Othmans-Group

## Group Members
-Abdulaziz Othman    ID:230065
-Amr Issa    ID:230265
-Mahdi Najjar    ID:220010
-Abdulrahman Raed    ID:230243
-Yunus Demirboga    ID:230701

---

## Member Contribution

| Member | Contribution |
|--------|-------------|
| Abdulaziz Othman | Implemented Task 2 (Crime Type Distribution) |
| Amr Issa |  Task 3 (Location Hotspots) |
| Mahdi Najjar | Implemented Task 4 (Year-wise Crime Analysis)|
| Yunus Demirboga | Assisted in Task 4 implementation and execution |
| Abdulrahman Raed | Implemented Task 5 (Arrest Analysis) |

---

## Task 2: Crime Type Distribution

### Command Used

```bash
mapred streaming \
  -files mapper_crime.py,reducer_sum.py \
  -mapper "python3 mapper_crime.py" \
  -reducer "python3 reducer_sum.py" \
  -input /data/chicago_crimes.csv \
  -output /user/arothman/project/m1/task2
````

### Sample Output

| Crime Type      | Count   |
| --------------- | ------- |
| THEFT           | 162,688 |
| BATTERY         | 151,930 |
| CRIMINAL DAMAGE | 91,241  |
| NARCOTICS       | 74,127  |
| ASSAULT         | 54,070  |

### Interpretation

The results show that theft is the most common crime in Chicago, followed by battery and criminal damage, indicating that property-related crimes dominate the dataset.

### Full Logs

```

full TERMINAL Output:
PS C:\Users\PCD\Documents\se446-project-group-Abdulaziz-Othman-Group\src> scp mapper_crime.py mapper_location.py reducer_sum.py arothman@134.209.172.50:~/
arothman@134.209.172.50's password: 
mapper_crime.py                                                                                                                                                                                                          100%  607     3.3KB/s   00:00    
mapper_location.py                                                                                                                                                                                                       100%  597     3.3KB/s   00:00    
reducer_sum.py                                                                                                                                                                                                           100%  525     2.9KB/s   00:00    
PS C:\Users\PCD\Documents\se446-project-group-Abdulaziz-Othman-Group\src> scp mapper.py reducer.py arothman@134.209.172.50:~/
C:\WINDOWS\System32\OpenSSH\scp.exe: stat local "mapper.py": No such file or directory
PS C:\Users\PCD\Documents\se446-project-group-Abdulaziz-Othman-Group\src> ssh arothman@134.209.172.50
arothman@134.209.172.50's password: 
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 5.15.0-170-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Mon Mar 23 20:21:05 UTC 2026

  System load:  0.04               Processes:             131
  Usage of /:   21.7% of 77.35GB   Users logged in:       1
  Memory usage: 50%                IPv4 address for eth0: 134.209.172.50
  Swap usage:   0%                 IPv4 address for eth0: 10.17.0.5

Expanded Security Maintenance for Applications is not enabled.

12 updates can be applied immediately.
To see these additional updates run: apt list --upgradable

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status

New release '24.04.4 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


*** System restart required ***
Last login: Mon Mar 23 20:18:49 2026 from 188.54.72.102
arothman@master-node:~$ source /etc/profile.d/hadoop.sh
arothman@master-node:~$ mapred streaming \
  -files mapper_crime.py,reducer_sum.py \
  -mapper "python3 mapper_crime.py" \
  -reducer "python3 reducer_sum.py" \
  -input /data/chicago_crimes.csv \
  -output /user/arothman/project/m1/task2
packageJobJar: [] [/opt/hadoop-3.4.1/share/hadoop/tools/lib/hadoop-streaming-3.4.1.jar] /tmp/streamjob17156136720185769835.jar tmpDir=null
2026-03-23 20:21:31,130 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at master-node/134.209.172.50:8032
2026-03-23 20:21:31,450 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at master-node/134.209.172.50:8032
2026-03-23 20:21:31,676 ERROR streaming.StreamJob: Error Launching job : Output directory hdfs://master-node:9000/user/arothman/project/m1/task2 already exists
Streaming Command Failed!
arothman@master-node:~$  hdfs dfs -rm -r /user/your_id/project/m1/task2
rm: `/user/your_id/project/m1/task2': No such file or directory
arothman@master-node:~$ hdfs dfs -rm -r /user/arothmand/project/m1/task2
rm: `/user/arothmand/project/m1/task2': No such file or directory
arothman@master-node:~$ ^C
arothman@master-node:~$ hdfs dfs -rm -r /user/your_id/project/m1/t2
rm: `/user/your_id/project/m1/t2': No such file or directory
arothman@master-node:~$ hdfs dfs -rm -r /user/arothman/project/m1/task2
Deleted /user/arothman/project/m1/task2
arothman@master-node:~$ mapred streaming \
  -files mapper_crime.py,reducer_sum.py \
  -mapper "python3 mapper_crime.py" \
  -reducer "python3 reducer_sum.py" \
  -input /data/chicago_crimes.csv \
  -output /user/arothman/project/m1/task2
packageJobJar: [] [/opt/hadoop-3.4.1/share/hadoop/tools/lib/hadoop-streaming-3.4.1.jar] /tmp/streamjob14943251897305246189.jar tmpDir=null
2026-03-23 20:23:19,229 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at master-node/134.209.172.50:8032
2026-03-23 20:23:19,856 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at master-node/134.209.172.50:8032
2026-03-23 20:23:20,836 INFO mapreduce.JobResourceUploader: Disabling Erasure Coding for path: /tmp/hadoop-yarn/staging/arothman/.staging/job_1771402826595_0138
2026-03-23 20:23:22,919 INFO mapred.FileInputFormat: Total input files to process : 1
2026-03-23 20:23:22,971 INFO net.NetworkTopology: Adding a new node: /default-rack/146.190.147.119:9866
2026-03-23 20:23:22,974 INFO net.NetworkTopology: Adding a new node: /default-rack/164.92.103.148:9866
2026-03-23 20:23:23,606 INFO mapreduce.JobSubmitter: number of splits:2
2026-03-23 20:23:25,042 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1771402826595_0138
2026-03-23 20:23:25,042 INFO mapreduce.JobSubmitter: Executing with tokens: []
2026-03-23 20:23:25,640 INFO conf.Configuration: resource-types.xml not found
2026-03-23 20:23:25,646 INFO resource.ResourceUtils: Unable to find 'resource-types.xml'.
2026-03-23 20:23:25,857 INFO impl.YarnClientImpl: Submitted application application_1771402826595_0138
2026-03-23 20:23:25,949 INFO mapreduce.Job: The url to track the job: http://master-node:8088/proxy/application_1771402826595_0138/
2026-03-23 20:23:25,955 INFO mapreduce.Job: Running job: job_1771402826595_0138
2026-03-23 20:23:41,673 INFO mapreduce.Job: Job job_1771402826595_0138 running in uber mode : false
2026-03-23 20:23:41,675 INFO mapreduce.Job:  map 0% reduce 0%
2026-03-23 20:24:05,524 INFO mapreduce.Job:  map 50% reduce 0%
2026-03-23 20:24:06,765 INFO mapreduce.Job:  map 100% reduce 0%
2026-03-23 20:24:20,390 INFO mapreduce.Job:  map 100% reduce 100%
2026-03-23 20:24:23,348 INFO mapreduce.Job: Job job_1771402826595_0138 completed successfully
2026-03-23 20:24:23,774 INFO mapreduce.Job: Counters: 55
        File System Counters
                FILE: Number of bytes read=11798790
                FILE: Number of bytes written=24540713
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
                Killed map tasks=1
                Launched map tasks=2
                Launched reduce tasks=1
                Data-local map tasks=2
                Total time spent by all maps in occupied slots (ms)=86068
                Total time spent by all reduces in occupied slots (ms)=24892
                Total time spent by all map tasks (ms)=43034
                Total time spent by all reduce tasks (ms)=12446
                Total vcore-milliseconds taken by all map tasks=43034
                Total vcore-milliseconds taken by all reduce tasks=12446
                Total megabyte-milliseconds taken by all map tasks=22033408
                Total megabyte-milliseconds taken by all reduce tasks=6372352
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
                GC time elapsed (ms)=621
                CPU time spent (ms)=10060
                Physical memory (bytes) snapshot=679198720
                Virtual memory (bytes) snapshot=6560870400
                Total committed heap usage (bytes)=348110848
                Peak Map Physical memory (bytes)=267591680
                Peak Map Virtual memory (bytes)=2185363456
                Peak Reduce Physical memory (bytes)=162717696
                Peak Reduce Virtual memory (bytes)=2190954496
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
2026-03-23 20:24:23,775 INFO streaming.StreamJob: Output directory: /user/arothman/project/m1/task2
arothman@master-node:~$ hdfs dfs -cat /user/your_id/project/m1/task2/part-00000
cat: `/user/your_id/project/m1/task2/part-00000': No such file or directory
arothman@master-node:~$ hdfs dfs -cat /user/arothmn/project/m1/task2/part-00000
cat: `/user/arothmn/project/m1/task2/part-00000': No such file or directory
arothman@master-node:~$ hdfs dfs -cat /user/arothman/project/m1/task2/part-00000
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


---

## Task 3: Location Hotspots

### Command Used

```bash
mapred streaming \
  -files mapper_location.py,reducer_sum.py \
  -mapper "python3 mapper_location.py" \
  -reducer "python3 reducer_sum.py" \
  -input /data/chicago_crimes.csv \
  -output /user/amissa/project/m1/task3
````

### Sample Output

| Location  | Count   |
| --------- | ------- |
| STREET    | 245,437 |
| RESIDENCE | 136,238 |
| APARTMENT | 60,925  |
| SIDEWALK  | 47,407  |
| OTHER     | 29,213  |

### Interpretation

Most crimes occur on streets and areas where people live , indicating that public spaces and living environments are the primary hotspots for criminal activity.

### Full Logs

```
Full Terminal Output:
PS C:\Users\PCD\Documents\se446-project-group-Abdulaziz-Othman-Group\src> scp mapper_location.py reducer_sum.py amissa@134.209.172.50:~/
amissa@134.209.172.50's password: 
mapper_location.py                                                                                                                                                                                                       100%  597     3.2KB/s   00:00    
reducer_sum.py                                                                                                                                                                                                           100%  525     2.8KB/s   00:00    
PS C:\Users\PCD\Documents\se446-project-group-Abdulaziz-Othman-Group\src> ssh amissa@134.209.172.50    
amissa@134.209.172.50's password: 
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 5.15.0-170-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Mon Mar 23 20:34:36 UTC 2026

  System load:  0.02               Processes:             123
  Usage of /:   21.8% of 77.35GB   Users logged in:       1
  Memory usage: 50%                IPv4 address for eth0: 134.209.172.51
  Swap usage:   0%                 IPv4 address for eth0: 10.17.0.05



*** System restart required ***
Last login: Mon Mar 23 20:21:06 2026 from 188.54.72.102
amissa@master-node:~$ source /etc/profile.d/hadoop.sh
amissa@master-node:~$ mapred streaming \
  -files mapper_location.py,reducer_sum.py \
  -mapper "python3 mapper_location.py" \
  -reducer "python3 reducer_sum.py" \
  -input /data/chicago_crimes.csv \
  -output /user/amissa/project/m1/task3
packageJobJar: [] [/opt/hadoop-3.4.1/share/hadoop/tools/lib/hadoop-streaming-3.4.1.jar] /tmp/streamjob7726410292104933482.jar tmpDir=null
2026-03-23 20:35:35,790 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at master-node/134.209.172.50:8032
2026-03-23 20:35:36,171 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at master-node/134.209.172.50:8032
2026-03-23 20:35:36,418 ERROR streaming.StreamJob: Error Launching job : Output directory hdfs://master-node:9000/user/amissa/project/m1/task3 already exists
Streaming Command Failed!
amissa@master-node:~$ hdfs dfs -rm -r /user/amissa/project/m1/task3
Deleted /user/amissa/project/m1/task3
amissa@master-node:~$ mapred streaming \
  -files mapper_location.py,reducer_sum.py \
  -mapper "python3 mapper_location.py" \
  -reducer "python3 reducer_sum.py" \
  -input /data/chicago_crimes.csv \
  -output /user/amissa/project/m1/task3
packageJobJar: [] [/opt/hadoop-3.4.1/share/hadoop/tools/lib/hadoop-streaming-3.4.1.jar] /tmp/streamjob11604072849737415040.jar tmpDir=null
2026-03-23 20:35:59,819 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at master-node/134.209.172.50:8032
2026-03-23 20:36:00,254 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at master-node/134.209.172.50:8032
2026-03-23 20:36:00,851 INFO mapreduce.JobResourceUploader: Disabling Erasure Coding for path: /tmp/hadoop-yarn/staging/amissa/.staging/job_1771402826595_0140
2026-03-23 20:36:02,773 INFO mapred.FileInputFormat: Total input files to process : 1
2026-03-23 20:36:02,806 INFO net.NetworkTopology: Adding a new node: /default-rack/164.92.103.148:9866
2026-03-23 20:36:02,809 INFO net.NetworkTopology: Adding a new node: /default-rack/146.190.147.119:9866
2026-03-23 20:36:03,479 INFO mapreduce.JobSubmitter: number of splits:2
2026-03-23 20:36:04,435 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1771402826595_0140
2026-03-23 20:36:04,435 INFO mapreduce.JobSubmitter: Executing with tokens: []
2026-03-23 20:36:04,922 INFO impl.YarnClientImpl: Submitted application application_1771402826595_0140
2026-03-23 20:36:04,983 INFO mapreduce.Job: The url to track the job: http://master-node:8088/proxy/application_1771402826595_0140/
2026-03-23 20:36:04,995 INFO mapreduce.Job: Running job: job_1771402826595_0140
2026-03-23 20:36:21,767 INFO mapreduce.Job: Job job_1771402826595_0140 running in uber mode : false
2026-03-23 20:36:21,770 INFO mapreduce.Job:  map 0% reduce 0%
2026-03-23 20:36:48,477 INFO mapreduce.Job:  map 100% reduce 0%
2026-03-23 20:37:00,568 INFO mapreduce.Job:  map 100% reduce 100%
2026-03-23 20:37:03,419 INFO mapreduce.Job: Job job_1771402826595_0140 completed successfully
2026-03-23 20:37:03,703 INFO streaming.StreamJob: Output directory: /user/amissa/project/m1/task3
amissa@master-node:~$ hdfs dfs -cat /user/amissa/project/m1/task3/part-00000
BUS     2658
FISTS   1157
...
YMCA    3
```



## Task 5: Law Enforcement Analysis
### Command Used

```bash
mapred:
mapred streaming \
  -files mapper_arrest_task5.py,reducer.py \
  -mapper "python3 mapper_arrest_task5.py" \
  -reducer "python3 reducer.py" \
  -input /data/chicago_crimes.csv \
  -output /user/araed/project/m1/task5

  Sample Results


false   551554
true    215199

Interpretation:

Only about 28% of crimes result in an arrest, meaning the majority of incidents (around 72%) do not lead to a suspect being caught, suggesting potential gaps in patrol effectiveness or investigative follow-through.





Full Logs:
araed@master-node:~$ mapred streaming \
  -files mapper_arrest_task5.py,reducer.py \
  -mapper "python3 mapper_arrest_task5.py" \
  -reducer "python3 reducer.py" \
  -input /data/chicago_crimes.csv \
  -output /user/araed/project/m1/task5
packageJobJar: [] [/opt/hadoop-3.4.1/share/hadoop/tools/lib/hadoop-streaming-3.4.1.jar] /tmp/streamjob17181469881607399968.jar tmpDir=null
2026-03-22 20:42:21,085 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at master-node/134.209.172.50:8032
2026-03-22 20:42:21,341 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at master-node/134.209.172.50:8032
2026-03-22 20:42:21,713 INFO mapreduce.JobResourceUploader: Disabling Erasure Coding for path: /tmp/hadoop-yarn/staging/araed/.staging/job_1771402826595_0116
2026-03-22 20:42:23,348 INFO mapred.FileInputFormat: Total input files to process : 1
2026-03-22 20:42:23,379 INFO net.NetworkTopology: Adding a new node: /default-rack/164.92.103.148:9866
2026-03-22 20:42:23,381 INFO net.NetworkTopology: Adding a new node: /default-rack/146.190.147.119:9866
2026-03-22 20:42:24,053 INFO mapreduce.JobSubmitter: number of splits:2
2026-03-22 20:42:24,870 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1771402826595_0116
2026-03-22 20:42:24,870 INFO mapreduce.JobSubmitter: Executing with tokens: []
2026-03-22 20:42:25,192 INFO conf.Configuration: resource-types.xml not found
2026-03-22 20:42:25,192 INFO resource.ResourceUtils: Unable to find 'resource-types.xml'.
2026-03-22 20:42:25,297 INFO impl.YarnClientImpl: Submitted application application_1771402826595_0116
2026-03-22 20:42:25,350 INFO mapreduce.Job: The url to track the job: http://master-node:8088/proxy/application_1771402826595_0116/
2026-03-22 20:42:25,352 INFO mapreduce.Job: Running job: job_1771402826595_0116
2026-03-22 20:42:41,071 INFO mapreduce.Job: Job job_1771402826595_0116 running in uber mode : false
2026-03-22 20:42:41,073 INFO mapreduce.Job:  map 0% reduce 0%
2026-03-22 20:43:07,823 INFO mapreduce.Job:  map 100% reduce 0%
2026-03-22 20:43:19,975 INFO mapreduce.Job:  map 100% reduce 100%
2026-03-22 20:43:22,819 INFO mapreduce.Job: Job job_1771402826595_0116 completed successfully
2026-03-22 20:43:23,011 INFO mapreduce.Job: Counters: 55
        File System Counters
                FILE: Number of bytes read=7452337
                FILE: Number of bytes written=15847726
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
                Killed map tasks=1
                Launched map tasks=2
                Launched reduce tasks=1
                Data-local map tasks=2
                Total time spent by all maps in occupied slots (ms)=96336
                Total time spent by all reduces in occupied slots (ms)=19078
                Total time spent by all map tasks (ms)=48168
                Total time spent by all reduce tasks (ms)=9539
                Total vcore-milliseconds taken by all map tasks=48168
                Total vcore-milliseconds taken by all reduce tasks=9539
                Total megabyte-milliseconds taken by all map tasks=24662016
                Total megabyte-milliseconds taken by all reduce tasks=4883968
        Map-Reduce Framework
                Map input records=793074
                Map output records=766753
                Map output bytes=5918825
                Map output materialized bytes=7452343
                Input split bytes=198
                Combine input records=0
                Combine output records=0
                Reduce input groups=2
                Reduce shuffle bytes=7452343
                Reduce input records=766753
                Reduce output records=2
                Spilled Records=1533506
                Shuffled Maps =2
                Failed Shuffles=0
                Merged Map outputs=2
                GC time elapsed (ms)=897
                CPU time spent (ms)=8810
                Physical memory (bytes) snapshot=668618752
                Virtual memory (bytes) snapshot=6563422208
                Total committed heap usage (bytes)=348073984
                Peak Map Physical memory (bytes)=262438912
                Peak Map Virtual memory (bytes)=2186960896
                Peak Reduce Physical memory (bytes)=150532096
                Peak Reduce Virtual memory (bytes)=2191810560
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
2026-03-22 20:43:23,011 INFO streaming.StreamJob: Output directory: /user/araed/project/m1/task5
araed@master-node:~$ hdfs dfs -cat /user/araed/project/m1/
task5/part-00000
false   551554
true    215199