FROM nvcr.io/nvidia/l4t-base:r32.4.4
RUN apt-get update -y && \
    apt-get autoremove -y && \
    apt-get install -qq -y --no-install-recommends \
    lsb-release \
    apt-transport-https \
    cmake \
    vim \
    build-essential \ 
    make \ 
    python3-dev \
    python3-testresources \
    python3-pip \
    python3-setuptools \
    curl \
    libxml2-dev \
    libxslt-dev && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean 

RUN curl https://stereolabs.sfo2.cdn.digitaloceanspaces.com/zedsdk/3.3/ZED_SDK_Tegra_JP44_v3.3.3.run --output zed_sdk_jp44_v3.3.3.run && \
chmod +x zed_sdk_jp44_v3.3.3.run && \
    ./zed_sdk_jp44_v3.3.3.run silent skip_tools && \
    rm -rf /usr/local/zed/resources/* 


# RUN python3 -m pip install Cython pyopengl \
# lxml \
# matplotlib \
# pycocotools

# RUN python3 -m pip install numpy 

# RUN python3 -m pip install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v44 ‘tensorflow<2’


CMD ["/bin/bash"]