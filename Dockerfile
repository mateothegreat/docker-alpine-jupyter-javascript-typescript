#FROM jupyter/minimal-notebook
FROM alpine:latest

RUN apk add --update python3 python gcc python3-dev libstdc++ g++ nodejs npm make

COPY requirements.txt /requirements.txt

RUN python3 -m pip --no-cache-dir install -r requirements.txt

RUN jupyter nbextension enable --py widgetsnbextension


RUN npm install --unsafe-perm -g ijavascript

RUN ijsinstall

RUN adduser -S user     && \
    mkdir /notebooks

COPY config.json /notebooks/config.json

RUN chown -R user /notebooks

WORKDIR /notebooks

USER user

ENTRYPOINT ["/usr/bin/jupyter-notebook", "--ip=0.0.0.0"]
