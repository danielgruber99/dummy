####################################################################################################
#
# Multi-stage build for iamportal_frontend
# ========================================
#
# STAGE 1: system
#   Up-to-date Linux system with flutter installed.
#
# STAGE 2: flutter-app (FINAL)
#   Run flutter app on nginx server.
#
####################################################################################################

# -------------------------------------
# Stage 1: system
# -------------------------------------
FROM ubuntu:22.04 as flutter-build

# install latest security updates and tools:
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y --no-install-recommends vim && \
    apt-get install git -y && \
    apt-get install wget -y && \
    apt-get install xz-utils -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install flutter
RUN wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.13.1-stable.tar.xz
RUN tar xf flutter_linux_3.13.1-stable.tar.xz

# Set flutter path
ENV PATH="${PATH}:/flutter/bin"

# add as safe directory otherwise it complains about dubious ownership
RUN git config --global --add safe.directory /flutter

# copy stuff
COPY flutter_app flutter_app

# prepare flutter stuff
RUN flutter precache
RUN flutter doctor

# flutter build
RUN cd flutter_app && flutter build web



