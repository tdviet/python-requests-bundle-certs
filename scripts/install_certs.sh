#!/bin/bash

# Link to certificate bundle on Github
cert_link=https://raw.githubusercontent.com/tdviet/python-requests-bundle-certs/main/certs/ca-certificates.crt

# Get path to Python requests certificate bundle
cert_path=$(python3 -m requests.certs)

if [ $? -eq 0 ]; then
    # Certificate bundle found, first make a backup copy with timestamp
    timestamp=$(date +%s)
    cp $cert_path $cert_path.$timestamp.backup
    if [ $? -eq 0 ]; then
        echo "A backup copy of current certificate bundle is made at" $cert_path.$timestamp.backup
    else
        echo "Error: Cannot make backup copy of current certificate bundle"
        exit 1
    fi

    # then download and overwrite the existing certificate bundle
    wget $cert_link -O $cert_path
    if [ $? -eq 0 ]; then
        echo "Certificate bundle with EGI Trust Anchor has been successfully installed"
    else
        echo "Error: Cannot download certificate bundle from" $cert_path
    fi

else
    # Error, python requests package may be not installed
    echo "Certificate bundle not found. You may have to install Python requests package"
fi





