[![Build Status](https://travis-ci.org/marcindulak/docker-nd188-bert-ai.svg?branch=master)](https://travis-ci.org/marcindulak/docker-nd188-bert-ai)

# Description

Ready-to-run Docker image for https://www.udacity.com/bertelsmann-tech-scholarships "AI track",
based on https://github.com/jupyter/docker-stacks/tree/master/datascience-notebook

The docker images are available at [dockerhub](https://hub.docker.com/r/marcindulak/nd188-bert-ai)


# Usage

First, make sure you are able to run the `docker run hello-world` example https://docs.docker.com/get-started/

**Note** on MS Windows install https://hub.docker.com/editions/community/docker-ce-desktop-windows.
If on MS Windows you are getting 'image operating system "linux" cannot be used on this platform'
follow https://docs.docker.com/docker-for-windows/#switch-between-windows-and-linux-containers
Consider using https://chocolatey.org/ as the package manager on MS Windows (it provides both docker and docker compose).

## Start the jupyter server using docker-compose (the recommended way)

```sh
docker-compose -f docker-compose.jupyter.yml up
```


## Start the jupyter server using docker

Start the jupyter server on localhost:8888 using docker-compose

```sh
docker run --rm -p 8888:8888 -v "$PWD":/home/jovyan/work marcindulak/nd188-bert-ai:latest
```


# Login to the jupyter UI

In a browser, access the url printed by the starting jupyter server, it looks like `http://127.0.0.1:8888/?token=c4dcbe678814d2e764518f723b66bbe1c56c53e54e86a44f`,
where your token will be different.


# Work directory sharing

The setup will "share" the current working directory "$PWD" with the docker container so the changes made using the jupyter UI
are synchronized with the docker host (your laptop).
The current contents of the current working directory is available in the jupyter UI under `work`.


# Using the course notebooks

Simply git clone (or download zip file and unzip) the repositry to the current directory

```sh
git clone https://github.com/udacity/deep-learning-v2-pytorch
```

navigate to the `work/deep-learning-v2-pytorch` directory in the jupyter UI, and start the desired notebook.


# Building

## Locally

Build based on the local [Dockerfile](Dockerfile)

```sh
docker build -t nd188-bert-ai .
```

List images

```sh
docker images
```


# Docker image tagging convention

The docker image is tagged with the datascience-notebook upstream version appended by a build number,
for example the first docker image based on datascience-notebook version `1386e2046833` is tagged with `1386e2046833-1`.


# Dependencies

docker and docker-compose


# License of this Dockerfile

BSD 3-Clause "New" or "Revised" License

**Note** please consult https://github.com/jupyter/jupyter/blob/master/LICENSE and
https://github.com/jupyter/docker-stacks/tree/master/datascience-notebook


# Todo

Try to reduce the size of the image (it's ~8G)
