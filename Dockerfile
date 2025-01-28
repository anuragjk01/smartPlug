# Use a suitable base image. Debian or Ubuntu are common choices for C development.
FROM ubuntu:focal

ENV DEBIAN_FRONTEND="noninteractive" TZ="Indian"

# Update package lists and install necessary build tools.
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install -y git && \
    apt-get install -y flex && \
    apt-get install -y bison && \
    apt-get install -y gperf && \
    apt-get install -y python3 && \
    apt-get install -y python3-pip && \
    apt-get install -y python3-venv && \
    apt-get install -y cmake && \
    apt-get install -y ninja-build && \
    apt-get install -y ccache && \
    apt-get install -y libffi-dev && \
    apt-get install -y libssl-dev && \
    apt-get install -y dfu-util && \
    apt-get install -y libusb-1.0-0 && \
        # Add any other dependencies your project requires (e.g., libraries, headers)
        rm -rf /var/lib/apt/lists/*

RUN mkdir /esp

WORKDIR /esp

RUN git clone -b v5.2.1 --recursive https://github.com/espressif/esp-idf.git

WORKDIR /esp/esp-idf/

RUN export IDF_GITHUB_ASSETS="dl.espressif.com/github_assets"
RUN export IDF_TOOLS_PATH="/esp/.espressif"

RUN /esp/esp-idf/install.sh esp32
RUN echo ". /esp/esp-idf/export.sh" >> ~/.bashrc

