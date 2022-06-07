FROM nick3point5/jupyter-js-net:1.0

RUN /root/.dotnet/tools/dotnet-interactive jupyter install

CMD jupyter lab --ip=* --port=$SERVER_PORT --no-browser --notebook-dir=$HOME --allow-root