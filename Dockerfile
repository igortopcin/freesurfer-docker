FROM ubuntu:trusty

# Install dependencies for FS
RUN apt-get update && \
    apt-get install -y tar less curl vim wget tcsh bc \
    perl-modules \
    libgomp1 \
    software-properties-common \
    gcc-multilib

# Download FS_v5.3.0 from MGH and untar to /opt
RUN wget -N -qO- ftp://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/5.3.0/freesurfer-Linux-centos6_x86_64-stable-pub-v5.3.0.tar.gz | tar -xzv -C /usr/local

# Configure license
COPY .license /usr/local/freesurfer/.license

RUN locale-gen en_US.UTF-8

ENV LANGUAGE=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    FREESURFER_HOME=/usr/local/freesurfer \
    SUBJECTS_DIR=/output \
    MNI_DIR=/usr/local/freesurfer/mni
    FSFAST_HOME /usr/local/freesurfer/fsfast
    MINC_BIN_DIR /usr/local/freesurfer/mni/bin
    MINC_LIB_DIR /usr/local/freesurfer/mni/lib
    MNI_DATAPATH /usr/local/freesurfer/mni/data
    FMRI_ANALYSIS_DIR /usr/local/freesurfer/fsfast
    PERL5LIB /usr/local/freesurfer/mni/lib/perl5/5.8.5
    MNI_PERL5LIB /usr/local/freesurfer/mni/lib/perl5/5.8.5

RUN echo "source $FREESURFER_HOME/SetUpFreeSurfer.sh" >> /etc/profile
