FROM python:2.7.10-slim
MAINTAINER Jihane Najdi <jnajdi@gmail.com>

RUN apt-get update && apt-get install -qq -y build-essential libpq-dev --fix-missing --no-install-recommends

ENV INSTALL_PATH /modydock
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

VOLUME ["static"]

CMD gunicorn -b 0.0.0.0:8000 "mobydock.app:create_app()"
