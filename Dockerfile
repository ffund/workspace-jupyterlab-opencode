FROM prairielearn/workspace-jupyterlab-python:latest

ENV PATH="/home/jovyan/.opencode/bin:${PATH}"
ENV XDG_CACHE_HOME="/tmp/opencode-cache"

USER root

RUN export HOME=/home/jovyan && curl -fsSL https://opencode.ai/install | bash
RUN mkdir -p /tmp/opencode-cache && chmod 1777 /tmp/opencode-cache

RUN pip install --no-cache-dir jupyter-ai

COPY opencode.json /home/jovyan/.config/opencode/opencode.json

USER jovyan
