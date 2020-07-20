#!/bin/bash
docker run -ti \
    -p 9999:9998 \
    -v ${PWD}:/home/lsst/pwd/ \
    -v /Users/James/Work/GOTO/UCAC4_goto:/opt/lsst/software/stack/stack/current/Linux64/astrometry_net_data/UCAC4_goto \
    -v /Users/James/Work/GOTO/obs_goto:/opt/lsst/software/stack/stack/current/Linux64/obs_goto \
    lsst:18_1_0