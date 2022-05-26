FROM mgoltzsche/podman:latest

ENV MOLECULE_NO_LOG false 

RUN apk --no-cache add ca-certificates wget 
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub 
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk 
RUN apk add glibc-2.28-r0.apk 

RUN apk update && apk add tar gcc make py3-pip zlib-dev openssl-dev libffi-dev docker g++ make 

ADD https://www.python.org/ftp/python/3.6.13/Python-3.6.13.tgz Python-3.6.13.tgz 
RUN tar xf Python-3.6.13.tgz && cd Python-3.6.13/ && ./configure && make && make altinstall 
ADD https://www.python.org/ftp/python/3.7.10/Python-3.7.10.tgz Python-3.7.10.tgz 
RUN tar xf Python-3.7.10.tgz && cd Python-3.7.10/ && ./configure && make && make altinstall 
ADD https://www.python.org/ftp/python/3.8.8/Python-3.8.8.tgz Python-3.8.8.tgz 
RUN tar xf Python-3.8.8.tgz && cd Python-3.8.8/ && ./configure && make && make altinstall 
ADD https://www.python.org/ftp/python/3.9.2/Python-3.9.2.tgz Python-3.9.2.tgz 
RUN tar xf Python-3.9.2.tgz && cd Python-3.9.2/ && ./configure && make && make altinstall 
RUN python3 -m pip install --upgrade pip && pip3 install tox selinux
RUN rm -rf Python
