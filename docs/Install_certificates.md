# Installing EGI Core Trust Anchor certificates for Python

## For production environment

If you don’t have the CA certificates installed in your machine, you can get them from
the [UMD EGI Core Trust Anchor Distribution](http://repository.egi.eu/?category_name=cas)

```
curl http://repository.egi.eu/sw/production/cas/1/current/repo-files/egi-trustanchors.list \
         > /etc/apt/sources.list.d/egi-trustanchors.list \
    && curl https://dl.igtf.net/distribution/igtf/current/GPG-KEY-EUGridPMA-RPM-3 \
       | apt-key add - \
    && apt-get update \
    && apt-get install -y ca-policy-egi-core

```

Once installed, get the location of the requests CA bundle with:

```
python -m requests.certs
```

If the output of that command is `/etc/ssl/certs/ca-certificates.crt`, you can add EGI CAs by executing:

```
cd /usr/local/share/ca-certificates
for f in /etc/grid-security/certificates/*.pem ; do ln -s $f $(basename $f .pem).crt; done
update-ca-certificates
```

If the output is `/etc/pki/tls/certs/ca-bundle.crt` add the EGI CAs with:

```
cd /etc/pki/ca-trust/source/anchors
ln -s /etc/grid-security/certificates/*.pem .
update-ca-trust extract
```

Otherwise, you are using internal requests bundle, which can be augmented with the EGI CAs with:

```
cat /etc/grid-security/certificates/*.pem >> $(python -m requests.certs)
```

Whole process can be done via [this script](https://github.com/tdviet/python-requests-bundle-certs/blob/main/scripts/install_egi_core_trust_anchor.sh)

## For testing in Python virtual environment

For quick tests in Python virtual environment, where users do not want (or not have root access) to install 
certificates via apt/yum, users can try to download and import the ready-to-use certificate bundle with EGI Core Trust 
Anchor by this [script](https://github.com/tdviet/python-requests-bundle-certs/blob/main/scripts/install_certs.sh).