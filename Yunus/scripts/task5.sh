scp mapper_arrest.py ydemirboga@134.209.172.50:~/


ssh ydemirboga@134.209.172.50
source /etc/profile.d/hadoop.sh


hdfs dfs -rm -r /user/ydemirboga/project/m1/task5


mapred streaming \
  -files mapper_arrest.py,reducer_sum.py \
  -mapper "python3 mapper_arrest.py" \
  -reducer "python3 reducer_sum.py" \
  -input /data/chicago_crimes.csv \
  -output /user/ydemirboga/project/m1/task5


hdfs dfs -cat /user/ydemirboga/project/m1/task5/part-00000
