#!/bin/tcsh

#BSUB -n 1               # Number of Cores
#BSUB -J test            # Job Name
#BSUB -W 09:23:59        # Wall Clock time (Days:Hours:Minutes)
#BSUB -oo test.%J.out    # Output File
#BSUB -eo test.%J.err    # Error File

Rscript test.R
