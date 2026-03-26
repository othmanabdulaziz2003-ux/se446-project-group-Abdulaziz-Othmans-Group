#!/usr/bin/env python3
import sys

for line in sys.stdin:
    line = line.strip()

    if not line:
        continue

    fields = line.split(",")

    if fields[0] == "ID":
        continue

    if len(fields) > 8:
        arrest = fields[8].strip().lower()

        if arrest == "true" or arrest == "false":
            print(f"{arrest}\t1")
