FROM prairielearn/workspace-jupyterlab-python:latest

USER root

RUN curl -fsSL https://opencode.ai/install | bash

RUN pip install --no-cache-dir jupyter-ai

COPY opencode.json /home/jovyan/.config/opencode/opencode.json

USER jovyan
