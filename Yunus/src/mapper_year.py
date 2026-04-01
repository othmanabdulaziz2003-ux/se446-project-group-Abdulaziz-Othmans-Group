import sys
date_IDX = 2


for line in sys.stdin:
    line = line.strip()

    if not line:
        continue

    parts = line.split(',')

    if len(parts) <= date_IDX:
        continue

    if parts[0] == 'ID':
        continue

    date = parts[date_IDX]

    year = date.split('/')[2].split()[0]
    
    print(f"{year}\t1")
