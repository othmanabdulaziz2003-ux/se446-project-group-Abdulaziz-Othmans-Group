scp mapper_year.py ydemirboga@134.209.172.50:~/

ssh ydemirboga@134.209.172.50
source /etc/profile.d/hadoop.sh

mapred streaming \
  -files mapper_year.py,reducer_sum.py \
  -mapper "python3 mapper_year.py" \
  -reducer "python3 reducer_sum.py" \
  -input /data/chicago_crimes.csv \
  -output /user/ydemirboga/project/m1/task4

hdfs dfs -cat /user/ydemirboga/project/m1/task4/part-00000
