FROM  python:3.10

WORKDIR  /tmp/amazon_test-main

COPY . .

COPY requirements.txt .

RUN pip3 install -r requirements.txt