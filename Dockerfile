FROM ubuntu:18.04

# Install necessary dependencies
RUN apt-get update -y \
    && apt-get install -y build-essential \
    && apt-get install -y cmake \
    && apt-get install -y git

# Copy dependencies to the docker image
COPY gcc-arm-8.2-2019.01-x86_64-aarch64-elf/ ./deps/
COPY gcc-arm-none-eabi-8-2019-q3-update/ ./deps/
COPY boost_1_70_0/ ./deps/

# Append bin folder of gcc arm compiler to bash configuration
RUN echo "export PATH=$PATH:/deps/bin" >> /root/.bashrc
