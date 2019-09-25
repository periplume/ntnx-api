# stage 1, build python and openssl from source
FROM ubuntu:18.04 AS builder
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y wget build-essential zlib1g-dev libffi-dev 
WORKDIR /src
ENV LDFLAGS="-L/usr/local/lib/"
ENV LD_LIBRARY_PATH="/usr/local/lib/"
ENV CPPFLAGS="-I/usr/local/include -I/usr/local/include/openssl"
RUN wget -q -O openssl-1.1.1d.tar.gz https://www.openssl.org/source/openssl-1.1.1d.tar.gz
RUN tar zxf openssl-1.1.1d.tar.gz
RUN cd openssl-1.1.1d ; ./config --prefix=/usr/local/ --openssldir=/usr/local shared zlib ; make ; make install_sw
RUN wget -q --no-check-certificate -O Python-3.7.4.tgz https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz
RUN tar zxf Python-3.7.4.tgz
RUN cd Python-3.7.4 ; ./configure --prefix=/usr/local  --with-openssl=/usr/local ; make ; make install
RUN ln -s python3 /usr/local/bin/python
RUN ln -s pip3 /usr/local/bin/pip
RUN pip install --upgrade pip

# stage 2, copy build artifacts, install other binaries and packages
FROM ubuntu:18.04
LABEL maintainer="Jason Lindemuth <jason.lindemuth@nutanix.com>"
ARG DEBIAN_FRONTEND=noninteractive
ENV LDFLAGS="-L/usr/local/lib/"
ENV LD_LIBRARY_PATH="/usr/local/lib/"
ENV CPPFLAGS="-I/usr/local/include -I/usr/local/include/openssl"
ENV PATH=".:/nutanix/bin:$PATH"
RUN apt-get update
COPY --from=builder /usr/local /usr/local
RUN apt-get install -y vim git gawk wget curl jq make iputils-ping
WORKDIR /nutanix
RUN mkdir code cfg bin logs
RUN python -m pip install --upgrade pip setuptools wheel
RUN cd code ; git clone git://github.com/psf/requests.git
RUN cd code/requests ; pip install .
#RUN pip install jinja2
#RUN pip install configobj
#RUN pip install pyyaml
#RUN pip install jsonpatch
#RUN pip install jsonschema
#RUN cd code ; git clone -b ubuntu/bionic https://git.launchpad.net/cloud-init
#RUN cd code/cloud-init ; python setup.py build
#RUN cd code/cloud-init ; python setup.py install
RUN cd code ; git clone git://github.com/nutanixdev/code-samples.git
RUN cd code ; git clone git://github.com/sandeep-car/api-lab.git
RUN cd code ; git clone git://github.com/periplume/ntnx-api.git
RUN cp code/ntnx-api/ntnx-api bin
CMD cat code/ntnx-api/ntnx-api.splash && bash
