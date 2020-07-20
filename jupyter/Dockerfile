FROM lsst:18_1_0

USER root

RUN source /opt/lsst/software/stack/loadLSST.bash && \
    conda install -c conda-forge -y jupyterlab

USER lsst