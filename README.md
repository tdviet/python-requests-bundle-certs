# Certificate bundle with EGI Core Trust Anchor for Python requests

This is a simple script to download and install Python requests certificate bundle with EGI Core
Trust Anchor certificates included.

It is intended for development/testing (e.g. Python Virtual Environments with virtualenv/venv) where
users do not have root access to install certificates properly via apt/yum package or do not want to do so. 
For production environment, you should follow instructions from
[there](https://github.com/tdviet/python-requests-bundle-certs/blob/main/docs/Install_certificates.md).

USE IT AT YOUR OWN RISK.

## Usage: 

Download and execute the script ["install_certs.sh"](https://github.com/tdviet/python-requests-bundle-certs/blob/main/scripts/install_certs.sh).
That will find the location of certificate bundle used by Python requests, make a backup copy then replace it with the certificate bundle from ["IGTF"]( https://dl.igtf.net/distribution/current/accredited/).

Change "python" to "python3" in the script if needed.

`$ wget https://raw.githubusercontent.com/tdviet/python-requests-bundle-certs/main/scripts/install_certs.sh`

`$ bash install_certs.sh`

In the case you need to revert the change, simply copy the backup file over the current certificate bundle.
