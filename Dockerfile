FROM python:2.7.18-alpine3.11
RUN pip install --no-cache-dir pip==20.3.4 setuptools==44.1.1 wheel==0.36.2 zc.buildout==3.0.0b2
