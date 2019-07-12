""" This code gets the line coverages, mutation coverages, and the results of 
PIT's default mutation types for each execution, for test suites from EvoSuite
and Randoop, and writes on a CSV file.  
"""

import re
import csv

for testSuite in range(10):
    values = {}
    prev = ''
    # e.g. yourFilename could be email__evo__" + str(testSuite + 1) + "__commons-email"
    fileName = "yourFileName" 

    with open(fileName, 'r') as fd:
        for line in fd:
            m = re.search(r'^>> Generated (\d+)(?: mutations)? Killed (\d+)', line)
            if m:
                value = 1.0 * int(m.group(2)) / int(m.group(1))
                mutator = prev.strip().lstrip('> ')
                try:
                    values[mutator].append(value)
                except KeyError:
                    values[mutator] = [value]
            prev = line

    for execution in range(10):
        row = []
        for mutator, l in values.items():
            print(mutator, l[execution])
            row.append(l[execution])

	# e.g. yourCSV could be evoResults.csv or randoopResults.csv	
        with open('yourCSV', 'a') as csvFile: 
            writer = csv.writer(csvFile)
            writer.writerow(row)

        csvFile.close()
