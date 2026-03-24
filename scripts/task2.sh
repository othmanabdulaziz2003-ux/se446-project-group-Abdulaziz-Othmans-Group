# === Start Hadoop environment ===
source /etc/profile.d/hadoop.sh

# === Remove old output (if exists) ===
 hdfs dfs -rm -r /user/arothman/project/m1/task2
# === Run MapReduce job on FULL dataset ===
mapred streaming \
  -files mapper_crime.py,reducer_sum.py \
  -mapper "python3 mapper_crime.py" \
  -reducer "python3 reducer_sum.py" \
  -input /data/chicago_crimes.csv \
  -output /user/arothman/project/m1/task2

# === View results (first few lines) ===
hdfs dfs -cat /user/arothman/project/m1/task2/part-00000 | head