#!/bin/bash

source ebi-setup.sh

#CWLTOIL="ipdb ../../toil-hack/venv/bin/cwltoil"
CWLTOIL=cwltoil
#RESTART=--restart # uncomment to restart a previous run; if the CWL descriptions have changed you will need to start over
#DEBUG=--logDebug  # uncomment to make output & logs more verbose

workdir=/tmp
#mkdir -p ${workdir}
# must be a directory accessible from all nodes

RUN=v3-paired
DESC=../emg-pipeline-v3-paired.cwl
INPUTS=../emg-pipeline-v3-paired-job.yaml

start=toil-${RUN}
mkdir -p ${start}/results
cd ${start}

/usr/bin/time ${CWLTOIL} ${RESTART} ${DEBUG} --logFile ${PWD}/log --outdir ${PWD}/results \
	--preserve-environment PATH CLASSPATH --batchSystem LSF --retryCount 1 \
	--workDir ${workdir} --jobStore ${PWD}/jobstore --disableCaching \
	${DESC} ${INPUTS} | tee output
