FROM jupyter/datascience-notebook:7a0c7325e470

LABEL maintainer="Marcin Dulak <marcin.dulak@gmail.com>"

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3-pip \
    && \
    rm -rf /var/lib/apt/lists/*

RUN conda install --quiet --yes \
    'pytorch=1.4.0' \
    'torchaudio=0.4.0' \
    'torchtext=0.5.0' \
    'torchvision=0.5.0' \
    'cudatoolkit=10.1' \
    'opencv=4.2.0' \
    -c pytorch \
    && \
    conda clean --all -f -y
