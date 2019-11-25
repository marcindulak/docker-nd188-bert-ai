FROM jupyter/datascience-notebook:1386e2046833

LABEL maintainer="Marcin Dulak <marcin.dulak@gmail.com>"

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3-pip \
    && \
    rm -rf /var/lib/apt/lists/*

RUN conda install --quiet --yes \
    'pytorch=1.3.1' \
    'torchvision=0.4.2' \
    'cudatoolkit=10.1' \
    -c pytorch \
    && \
    conda clean --all -f -y
