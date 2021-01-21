#!/bin/bash

# Link to IGTF certificate bundle
cert_link="https://dl.igtf.net/distribution/current/accredited/"
cert_profiles=("classic" "mics" "slcs")

# Temporary directory
TMP="/tmp/"


# Get path to Python requests certificate bundle
cert_path=$(python3 -W ignore -m requests.certs)

if [ $? -eq 0 ]; then

    # Certificate bundle found, first make a backup copy with timestamp
    timestamp=$(date  +'%Y%m%d%H%M%S')
    cp $cert_path $cert_path.$timestamp.backup

    if [ $? -eq 0 ]; then
        echo "A backup copy of current certificate bundle is made at" $cert_path.$timestamp".backup"
    else
        echo "Error: Cannot make backup copy of current certificate bundle"
        exit 1
    fi

    # then download and extract certificates to  the existing certificate bundle

    for profile in ${cert_profiles[@]}; do

        filename="igtf-preinstalled-bundle-"$profile".tar.gz"
        # Download certificate bundle
        wget -q $cert_link$filename -O $TMP$filename

        if [ $? -ne 0 ]; then
            echo "Error: Cannot download certificate bundle from" $cert_link$filename
            rm -f $TMP$filename
            exit 1
        fi

        # Extract certificates from downloaded file to the certificate bundle
        tar -xzOf $TMP$filename --wildcards "*.pem" >> $cert_path

        if [ $? -ne 0 ]; then
            echo "Error: Cannot extract certificate bundle to" $cert_path
            exit 1
        fi

        # Clean up
        rm -f $TMP$filename
    done

    echo "SUCCESS: IGTF certificates have been added to" $cert_path

else
    # Error, python requests package may be not installed
    echo "Error: Certificate bundle not found. You may have to install Python requests package"
fi





