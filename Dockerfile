FROM ubuntu:18.04

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

WORKDIR /app
ARG GIT_COMMIT
ENV FLASK_GIT_VERSION $GIT_COMMIT
ENV FLASK_APP display-config.py
ENV FLASK_RUN_HOST 0.0.0.0
ENV FLASK_RUN_PORT 8080
ENV FLASK_APP_VERSION 1.0.0
ENV FLASK_ENV development
ENV FLASK_DEBUG 1
RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip
RUN pip install flask 
RUN pip install requests
COPY . /app
ENTRYPOINT [ "python" ]
CMD [ "display-config.py" ]
