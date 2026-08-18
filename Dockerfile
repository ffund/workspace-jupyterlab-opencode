FROM prairielearn/workspace-jupyterlab-python:latest

ENV PATH="/usr/local/bin:${PATH}"
ENV XDG_CACHE_HOME="/tmp/opencode-cache"

USER root

RUN mkdir -p /opt/opencode && export HOME=/opt/opencode && curl -fsSL https://opencode.ai/install | bash
RUN mkdir -p /tmp/opencode-cache && chmod 1777 /tmp/opencode-cache

RUN pip install --no-cache-dir jupyter-ai

COPY opencode.json /opt/opencode-config/opencode.json
COPY opencode-wrapper /usr/local/bin/opencode
RUN chmod 0755 /usr/local/bin/opencode

USER jovyan
