FROM python:3.8    
ENV PYTHONUNBUFFERED 1
RUN mkdir /bookcomment

ADD requirements.txt /bookcomment/
ADD /bookcomment /bookcomment/
WORKDIR /bookcomment

RUN pip install -U pip

RUN pip config set global.index-url http://mirrors.aliyun.com/pypi/simple
RUN pip config set install.trusted-host mirrors.aliyun.com
 
RUN pip3 install -r requirements.txt

RUN python3  -c "from django.contrib.auth import get_user_model; " \
                "User = get_user_model(); User.objects.create_superuser('admin', 'Lidaxiang2020')"
