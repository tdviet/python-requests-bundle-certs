# Certificate bundle for Python requests

This is a simple script to download and install Python requests certificate bundle with EGI Core
Trust Anchor certificates included.

It is intended ONLY for development/testing (e.g. Python Virtual Environments with virtualenv/venv) where
users do not have root access to install certificates properly via apt package. Do not use it in production environment.

USE IT AT YOUR OWN RISK.

## Usage: 

Download and execute the script "install_certs.sh" in "/scripts". That will find the location of certificate bundle
used by Python requests, make a backup copy and replace it with the certificate bundle from GitHub.



