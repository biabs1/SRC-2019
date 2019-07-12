#!/bin/bash

:' This script executes PIT 10 times for each project and each test suite.
The projects and test suites have to be organized as follow:
   projectsAndTestSuites
     project1 				   ... 	project10
       evo 	     randoop 	   manual	  evo 		randoop       manual
	 1 2 ... 10    1 2 ... 10    1		    1 2 ... 10	  1 2 ... 10    1

Inside each folder labelled with numbers (1, 2, ..., 10), 
inside each generation technique folder, inside each project folder, there is the project 
with a different test suite.
'

OUTPUTDIR="$HOME/results"

for fI in */
do
    cd "$fI"
    for fII in */
    do
        cd "$fII"
        for fIII in */
        do
            cd "$fIII"
            for fIV in */
            do
                cd "$fIV"
                echo "---------------------------------------"
                echo "I am here:" `pwd`
                OUTPUTFILE="${OUTPUTDIR}/${fI//\//}__${fII//\//}__${fIII//\//}__${fIV//\//}"

                if [ -f "$OUTPUTFILE" ]
                then
                    echo "File $OUTPUTFILE already exists. Skipping this directory."
		    cd ..
                    continue
                fi
 
                for run in {1..10};
                do
                    echo "Execution #$run"
                    mvn org.pitest:pitest-maven:mutationCoverage > /tmp/mvn-stdout.txt 2> /tmp/mvn-stderr.txt
                    cat /tmp/mvn-stdout.txt /tmp/mvn-stderr.txt >> /tmp/mvn-output.txt
                    rm -f /tmp/mvn-stdout.txt /tmp/mvn-stderr.txt
                done
                # At this point, /tmp/mvn-output.txt contains the output
                # of the 10 executions, so we move it to a safe location
                # with a proper name
                mv /tmp/mvn-output.txt "$OUTPUTFILE"
                cd ..
            done
            cd ..
        done
        cd ..
    done
    cd ..
done
