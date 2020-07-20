#Use the official LSST stack as a parent image
FROM lsstsqre/centos:7-stack-lsst_distrib-v18_1_0

ARG UID=501
ARG GID=20
USER root
RUN usermod -g $GID -u $UID lsst
RUN chown -R lsst:lsst /home/lsst
RUN chown lsst:lsst /opt/lsst/software/stack/stack/current
RUN chown lsst:lsst /opt/lsst/software/stack/stack/current/ups_db
RUN chown lsst:lsst /opt/lsst/software/stack/stack/current/ups_db/astrometry_net_data
COPY --chown=lsst:lsst ./bashrc /home/lsst/.bashrc

#RUN curl http://ds9.si.edu/download/centos7/ds9.centos7.8.0.1.tar.gz | tar xz -C /usr/local/bin

USER lsst
RUN mkdir -m 700 /tmp/runtime-lsst