#!/bin/bash

# Link to certificate bundle on Github
cert_link=https://raw.githubusercontent.com/tdviet/python-requests-bundle-certs/main/certs/ca-certificates.crt

# Get path to Python requests certificate bundle
cert_path=$(python -m requests.certs)

if [ $? -eq 0 ]; then
    # Certificate bundle found, first make a backup copy with timestamp
    timestamp=$(date +%s)
    cp $cert_path $cert_path.$timestamp.backup

    # then download and overwrite the existing certificate bundle
    wget $cert_link -O $cert_path

else
    echo "Certificate bundle not found"
fi





