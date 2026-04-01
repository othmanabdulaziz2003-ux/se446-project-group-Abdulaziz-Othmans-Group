import sys
Location_description_IDX = 7


for line in sys.stdin:
    line = line.strip()

    if not line:
        continue

    parts = line.split(',')

    if len(parts) <= Location_description_IDX:
        continue

    if parts[0] == 'ID':
        continue

    location_description = parts[Location_description_IDX]
    
    print(f"{location_description}\t1")
