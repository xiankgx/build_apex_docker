FROM pytorch/pytorch:1.5.1-cuda10.1-cudnn7-devel

RUN apt update
RUN apt install --yes git vim
RUN apt install --yes libglib2.0-0 libsm6 libxext6 libxrender-dev

WORKDIR /tmp/
RUN git clone https://github.com/NVIDIA/apex
WORKDIR /tmp/apex/
RUN pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./
RUN rm -r /tmp/apex/

WORKDIR /workspace/