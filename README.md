# Using the LSST stack with Docker

This repository contains the Docker files and setup that I use to work with the LSST stack within Docker. The repository contains two directories. The "standard" directory contains the files needed to create and run the standard LSST Docker image and container. The "jupyter" directory contains the files needed to add Jupyter notebook functionality to the standard Docker container. The latter builds on "standard" Docker image, so if you want Jupyter functionality, you'll need to build the standard Docker image first.

The Docker containers assume certain user priveleges. To ensure these, you'll need to provide your group and user ids when building the "standard" docker image. To do that:
```
>> cd standard
>> docker build --build-arg UID=$(id -u) --build-arg GID=$(id -g) -t lsst:18_1_0 .
>> cd ../jupyter
>> docker build -t lsstjupyter:18_1_0 .
```

The docker containers are launched via shell scripts (which automates the connection to local volumes), which you need to make executable. You'll need to change some paths in those shell scripts (specifically to your local obs_package and to the local reference catalogue that you use to solve for astrometry). Once you've sorted out those paths then, from within the top level directory of this repository, execute:
```
>> cd standard
>> chmod 755 runLsstDocker.sh
>> cd ../jupyter
>> chmod 755 runDocker.sh
```

Then, navigate to the directory where your data is kept and call the shell scripts (in this case, I keep the Docker files in `~/Docker/lsst/`):
```
>> chmod 755 ~/Docker/lsst/jupyter/runDocker.sh
```
Of course, you could link the shell scripts to somewhere in your executable path (e.g., `/usr/local/bin`) should you not want to use the full path every time.

From within the docker container, navigate to `/home/lsst/pwd/`, where you'll find the files and directories that currently reside in the PWD where you launched the container.

Don't forget to setup your obs package once you've launched your container (e.g., `setup obs_necam`)! To start a jupyter notebook from within the docker container execute:
```
jupyter-notebook --ip=0.0.0.0
```
Then follow in on-screen instructions.

