mapred streaming \
  -files mapper_arrest_task5.py,reducer.py \
  -mapper "python3 mapper_arrest_task5.py" \
  -reducer "python3 reducer.py" \
  -input /data/chicago_crimes.csv \
  -output /user/araed/project/m1/task5



  
