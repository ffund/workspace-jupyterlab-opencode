FROM prairielearn/workspace-jupyterlab-python:latest

ENV PATH="/home/jovyan/.opencode/bin:${PATH}"

USER root

RUN HOME=/home/jovyan curl -fsSL https://opencode.ai/install | bash

RUN pip install --no-cache-dir jupyter-ai

COPY opencode.json /home/jovyan/.config/opencode/opencode.json

USER jovyan
