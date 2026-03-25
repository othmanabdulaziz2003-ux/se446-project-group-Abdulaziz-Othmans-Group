#!/usr/bin/env python3
import sys

DATE_IDX = 2

for line in sys.stdin:
    line = line.strip()

    # Skip empty lines
    if not line:
        continue

    parts = line.split(',')

    # Sanity check
    if len(parts) <= DATE_IDX:
        continue

    # Skip header
    if parts[0] == 'ID':
        continue

    date_str = parts[DATE_IDX].strip()
    date_part = date_str.split(' ')[0]
    year_parts = date_part.split('/')

    if len(year_parts) != 3:
        continue

    year = year_parts[2]
    print(f"{year}\t1")