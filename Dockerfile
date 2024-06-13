FROM  python:3.10

WORKDIR  /tmp/saucedemo_test-main

COPY . .

RUN pip3 install -r requirements.txt