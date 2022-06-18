FROM nick3point5/jupyter-js-net
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

RUN  /root/.dotnet/tools/dotnet-interactive jupyter install
WORKDIR ${HOME}