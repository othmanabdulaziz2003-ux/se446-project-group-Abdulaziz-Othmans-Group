import sys
import csv

Arrest_IDX = 8

for line in sys.stdin:
    line = line.strip()

    if not line:
        continue

    try:
        parts = next(csv.reader([line]))
    except:
        continue

    if len(parts) <= Arrest_IDX:
        continue

    if parts[0] == 'ID':
        continue

    arrest = parts[Arrest_IDX].lower()

    if arrest in ('true', 'false'):
        print(f"{arrest}\t1")
