FROM ubuntu:18.04

# Install necessary dependencies
RUN apt-get update -y \
    && apt-get install -y build-essential \
    && apt-get install -y wget \
    && apt-get install -y cmake \
    && apt-get install -y git

# Download Doxygen repo
RUN git clone https://github.com/doxygen/doxygen.git

# Copy dependencies to the docker image
COPY aarch/ ./aarch/
COPY gcc-arm-8.2-2019.01-x86_64-aarch64-elf/ ./deps/
COPY gcc-arm-none-eabi-8-2019-q3-update/ ./deps/

# Install Doxygen
WORKDIR /doxygen
RUN make \
    && make install

# Append bin folder of gcc arm compiler to bash configuration
RUN echo "export PATH=$PATH:/deps/bin" >> /root/.bashrc
