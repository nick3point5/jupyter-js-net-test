FROM nick3point5/jupyter-js-net

# ARG NB_USER=jovyan
# ARG NB_UID=1000
# ENV USER ${NB_USER}
# ENV NB_UID ${NB_UID}
# ENV HOME /home/${NB_USER}

# RUN adduser --disabled-password \
#     --gecos "Default user" \
#     --uid ${NB_UID} \
#     ${NB_USER}

# COPY . ${HOME}
# USER root
# RUN chown -R ${NB_UID} ${HOME}
# USER ${NB_USER}

# RUN python3 -m pip install --no-cache-dir notebook jupyterlab

ARG NB_USER="jovyan"
ARG NB_UID="1000"
ARG NB_GID="100"

ENV HOME="/home/${NB_USER}"

USER root

EXPOSE 8888
ENTRYPOINT ["tini", "-g", "--"]

USER ${NB_UID}

WORKDIR "${HOME}"

CMD bash

CMD jupyter lab --ip=* --port=$SERVER_PORT --no-browser --notebook-dir=$HOME --allow-root