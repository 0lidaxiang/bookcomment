FROM python:3.8    
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code  
ADD requirements.txt /code/ 
RUN pip install -U pip
RUN pip config set global.index-url http://mirrors.aliyun.com/pypi/simple
RUN pip config set install.trusted-host mirrors.aliyun.com
RUN pip3 install -r requirements.txt