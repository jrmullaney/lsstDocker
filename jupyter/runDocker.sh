#!/bin/bash
docker run -ti \
    -p 8888:8888 \
    -v ${PWD}:/home/lsst/pwd/ \
    -v /Users/James/Work/GOTO/UCAC4_goto:/opt/lsst/software/stack/stack/current/Linux64/astrometry_net_data/UCAC4_goto \
    -v /Users/James/Work/GOTO/obs_goto:/opt/lsst/software/stack/stack/current/Linux64/obs_goto \
    lsstjupyter:18_1_0

# Once in the docker container, start a jupyter-notebook with:
# jupyter-notebook --ip=0.0.0.0
# then follow the on-screen instructions.