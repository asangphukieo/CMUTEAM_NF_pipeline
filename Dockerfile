################################
# Docker file for fastq preprocess based on GATK best practice version 1.0
# Base on Ubuntu 20.04 and gatk:4.2.6.1
# gatk:4.2.6.1
# samtools:1.7
# Bwa 0.7.17
# picard-2.27.1
################################

FROM broadinstitute/gatk:4.2.6.1

#Developer/maintainer
MAINTAINER Apiwat Sangphukieo

%post

    #for security fixe:
    apt upgrade -y
    #apt install -y wget bzip2

    #install conda
    cd /opt
    rm -fr miniconda

    #miniconda3: get miniconda3 version 4.7.12
    wget https://repo.continuum.io/miniconda/Miniconda3-4.7.12-Linux-x86_64.sh -O miniconda.sh

    #install conda
    bash miniconda.sh -b -p /opt/miniconda
    export PATH="/opt/miniconda/bin:$PATH"
  
    #install varscan
    conda install -c bioconda -y picard=2.27.1
    conda install -c bioconda -y bwa=0.7.17
    
    #cleanup    
    conda clean -y --all
    rm -f /opt/miniconda.sh
    apt autoremove --purge
    apt clean
    cd /gatk

