FROM 'nvcr.io/nvidia/pytorch:21.12-py3'

RUN apt-get update && apt-get install -y sudo
ARG USERNAME=ikumalab
ARG GROUPNAME=ikumalab
ARG PASSWORD=ikumalab
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USERNAME && \
    echo $USERNAME:$PASSWORD | chpasswd && \
    echo "$USERNAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# 作成したユーザーに切り替える
USER ${USERNAME}

WORKDIR /workspace/shared

RUN pip install dominate pycuda nvidia-pyindex && \
    pip install --upgrade nvidia-tensorrt
