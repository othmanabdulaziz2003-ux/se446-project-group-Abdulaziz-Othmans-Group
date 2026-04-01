import sys
Primary_Type_IDX = 5


for line in sys.stdin:
    line = line.strip()

    if not line:
        continue

    parts = line.split(',')

    if len(parts) <= Primary_Type_IDX:
        continue

    if parts[0] == 'ID':
        continue

    primary_type = parts[Primary_Type_IDX]
    
    print(f"{primary_type}\t1")
