[![Build Status](https://travis-ci.org/ProteinsWebTeam/ebi-metagenomics-cwl.svg?branch=master)](https://travis-ci.org/ProteinsWebTeam/ebi-metagenomics-cwl)

# ebi-metagenomics-cwl
This repository contains the CWL description of the EBI Metagenomics pipeline

The steps of the pipeline are visualised on the website and can be found here:
https://www.ebi.ac.uk/metagenomics/pipelines/3.0

## How to run our CWL files?

1. Install the cwlref-runner as described here:
https://github.com/common-workflow-language/cwltool

2. Get a clone of this repository

3. Install the command line tools on your local machine/cluster (e.g. FragGeneScan or InterProScan 5)

4. Choose the command line tool or workflow you want to run

5. Write an YAML job file for the selected command line tool or workflow

6. Run the command line tool/workflow, specifying the path if the tools are not
   installed to /usr/bin or /usr/local/bin

  $ PATH=~/my/FragGeneScan:~/my/InterProScan:${PATH} cwltool \
      --preserve-environment PATH workflows/emg-pipeline-v3.cwl \
      workflows/emg-pipeline-v3-example-job.yaml
