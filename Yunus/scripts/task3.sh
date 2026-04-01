scp mapper_location.py ydemirboga@134.209.172.50:~/

ssh ydemirboga@134.209.172.50
source /etc/profile.d/hadoop.sh

mapred streaming \
  -files mapper_location.py,reducer_sum.py \
  -mapper "python3 mapper_location.py" \
  -reducer "python3 reducer_sum.py" \
  -input /data/chicago_crimes.csv \
  -output /user/ydemirboga/project/m1/task3

  /user/ydemirboga/project/m1/task3/part-00000
