# === Start Hadoop environment ===
source /etc/profile.d/hadoop.sh

# === Remove old output (if exists) ===
 hdfs dfs -rm -r /user/amissa/project/m1/task3
# === Run MapReduce job on FULL dataset ===
 mapred streaming \
  -files mapper_location.py,reducer_sum.py \
  -mapper "python3 mapper_location.py" \
  -reducer "python3 reducer_sum.py" \
  -input /data/chicago_crimes.csv \
  -output /user/amissa/project/m1/task3

# === View results (first few lines) ===
hdfs dfs -cat /user/amissa/project/m1/task3/part-00000 | head
