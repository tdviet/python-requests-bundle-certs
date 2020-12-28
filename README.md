# Certificate bundle with EGI Core Trust Anchor for Python requests

This is a simple script to download and install Python requests certificate bundle with EGI Core
Trust Anchor certificates included.

It is intended for development/testing (e.g. Python Virtual Environments with virtualenv/venv) where
users do not have root access to install certificates properly via apt/yum package or do not want to do so. 
For production environment, you should follow instructions from
[there](https://github.com/tdviet/python-requests-bundle-certs/blob/main/docs/Install_certificates.md)

USE IT AT YOUR OWN RISK.

## Usage: 

Download and execute the script *"install_certs.sh"* in *"/scripts"*. That will find the location of certificate bundle
used by Python requests, make a backup copy then replace it with the certificate bundle from GitHub.

`$ wget https://raw.githubusercontent.com/tdviet/python-requests-bundle-certs/main/scripts/install_certs.sh`

`$ source install_certs.sh`
