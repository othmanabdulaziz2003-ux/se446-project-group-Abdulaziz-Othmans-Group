#!/usr/bin/env python3
import sys

# Index of relevant columns (check your CSV header!)
# Schema: ID, Case Number, Date, ..., Arrest(8), ..., District(11)
LOCATION_IDX = 7

for line in sys.stdin:
    line = line.strip()

    # Skip empty lines
    if not line:
        continue

    parts = line.split(',')

    # Skip CSV header line
    if parts[0] == 'ID':
        continue

    # Sanity Check: Ensure line has enough columns
    if len(parts) <= LOCATION_IDX:
        continue

    # Extract fields
    location = parts[LOCATION_IDX]
    print(f"{location}\t1")
