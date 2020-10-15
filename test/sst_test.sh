#!/bin/bash

export PYTHONPATH=${PYTHONPATH}:/opt/adios2/lib/python3/dist-packages/adios2
export PYTHONPATH=${PYTHONPATH}:/MDTrAnal/lib

../../../bin/LINUX64/nwchem 1h9t_prep.nw
mpirun --allow-run-as-root -n 4 python3 /MDTrAnal/src/md_compress_adaptive_adios2.py & 

mpirun --allow-run-as-root -n 4 ../../../bin/LINUX64/nwchem 1h9t_md.nw

echo "job finished in $SECONDS seconds."| tee /host/run_time_SST_10000.txt
