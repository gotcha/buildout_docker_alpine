FROM python:2.7.15-alpine3.8
WORKDIR /usr/src/app
RUN pip install --no-cache-dir setuptools==40.6.2 zc.buildout==2.12.2
CMD [ "buildout" ]
