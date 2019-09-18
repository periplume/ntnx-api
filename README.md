# ntnx-api
A containerized collection of icommand-line api tools for Nutanix.

A simplified and easily reproducable development environment for the lazy among
us.  Meant as a LAB environment for *demonstration* purposes only.  Terminal
(command line) only.  **Not for production systems.  Use at your own risk.  Not
supported by Nutanix.**

You say API, I say let's *see it* in action.  I don't like GUIs, however pretty
and delightful.  Everything is programmable.  Unbind yourself.  Automate!

## Requirements
1. Linux (docker on mac planned)
2. Docker

## Includes
1. Python 3.7.4 (compiled from source)
2. Openssl 1.1.1d (compiled from source)
3. pip
4. requests
5. vim
6. cloud-init
7. Sandeep Cariapa's api-lab scripts

## Installation instructions
Can be installed with git:
```
# git clone https://github.com/periplume/ntnx-api.git
```

Can be installed with wget:
```
# wget -O install https://github.com/periplume/ntnx-api/raw/master/install && chmod 755 install
# ./install
```

Can be installed with curl:
```
# curl -OL https://github.com/periplume/ntnx-api/raw/master/install && chmod 755 install
# ./install
```

Built as a docker multi-stage image.  Before the multi-stage, the image size
exceeded 1GB.  After the multi-stage build, the image size was reduced by nearly
50%.  See Dockerfile for details.

TODO: move stable image to dockerhub to avoid the docker build times (~15 min)
