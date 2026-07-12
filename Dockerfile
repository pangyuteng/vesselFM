
FROM pytorch/pytorch:2.5.1-cuda11.8-cudnn9-runtime

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

RUN mkdir /opt/vesselfm
COPY . /opt/vesselfm
WORKDIR /opt/vesselfm

ENV PYTHONPATH=/opt/vesselfm
ENV HF_HOME=/opt/huggingfacecache
ENV PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True
