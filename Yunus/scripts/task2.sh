#!/bin/bash
source /etc/profile.d/hadoop.sh

mapred streaming \
  -files mapper_task2.py,Global_reducer.py \
  -mapper "python3 mapper_task2.py" \
  -reducer "python3 Global_reducer.py" \
  -input /data/chicago_crimes.csv \
  -output /user/ydemirboga/project/m1/task2_final

hdfs dfs -cat /user/ydemirboga/project/m1/task2_final/part-00000  
