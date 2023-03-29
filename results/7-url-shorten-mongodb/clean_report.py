import sys

with open('report_clean.txt', 'w') as f:

    count = 1
    for line in sys.stdin:
        if count < 9:
            count = count + 1
            continue

        if count > 9 and count < 12:
            count = count + 1
            f.write(line)
            continue

        if len(line) < 45:
            continue

        if line[44] == ".":
            continue

        f.write(line)