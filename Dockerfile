
FROM python:3.9-bookworm

COPY --from=continuumio/miniconda3:26.3.2 /opt/conda /opt/conda

ENV PATH=/opt/conda/bin:$PATH

# https://stackoverflow.com/a/73575335/868736
RUN set -ex && \
    conda config --set always_yes yes --set changeps1 no && \
    conda info -a && \
    conda config --add channels conda-forge && \
    conda install --quiet --freeze-installed -c main conda-pack

RUN conda create -n vesselfm python=3.9
SHELL ["conda", "run", "-n", "vesselfm", "/bin/bash", "-c"]
COPY * /opt/vesselfm
WORKDIR /opt/vesselfm
RUN pip install --no-cache-dir -e .
