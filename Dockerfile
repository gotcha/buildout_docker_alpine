FROM python:2.7.16-alpine3.9
WORKDIR /usr/src/app
RUN pip install --no-cache-dir setuptools==40.8.0 zc.buildout==2.13.1
CMD [ "buildout" ]
