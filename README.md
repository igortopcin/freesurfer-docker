# FreeSurfer v5.3 docker image

This is a docker image that contains FreeSurfer v5.3 installed and ready to be used. This project was based on https://github.com/vistalab/docker, with few modifications to support a larger range of freesurfer executables.

## Building the docker image
To build the docker image:

```shell
docker build -t freesurfer .
```

## Important directories
The `FREESURFER_HOME` is located in /usr/local/freesurfer
The `SUBJECTS_DIR` is /data/subjects/freesurfer

When running the docker container, you may want to mount the `SUBJECTS_DIR` and also an input file, e.g.:

```shell
run --rm -ti \
 -v </path/to/input/data>:/input \
 -v </path/for/output/data>:/opt/freesurfer/subjects \
 freesurfer \
 recon-all -i /input/<t1_file.nii.gz> -subjid <subjectID> -all
```
