FROM python:3.6.8
RUN mkdir /opt/demo
WORKDIR /opt/demo
COPY . .
RUN pip install -r app/requirements.txt
CMD export $(cat .env | xargs) && python hello.py
