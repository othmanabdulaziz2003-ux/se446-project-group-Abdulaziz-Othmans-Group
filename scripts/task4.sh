# === Start Hadoop environment ===
source /etc/profile.d/hadoop.sh

# === Remove old output (if exists) ===
hdfs dfs -rm -r /user/mnajjar/project/m1/task4

# === Run MapReduce job on FULL dataset ===
mapred streaming \
  -files mapper_task4.py,reducer.py \
  -mapper "python3 mapper_task4.py" \
  -reducer "python3 reducer.py" \
  -input /data/chicago_crimes.csv \
  -output /user/mnajjar/project/m1/task4

# === View results (first few lines) ===
hdfs dfs -cat /user/mnajjar/project/m1/task4/part-00000 | head