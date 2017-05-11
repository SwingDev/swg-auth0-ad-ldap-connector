# Auth0 AD/LDAP Connector

## Test run from git

 - `git clone git@github.com:SwingDev/swg-auth0-ad-ldap-connector.git`
 - put your `config.json` in `./shared/config.json`
 - run `sh run.sh`

## First run

You will need to attach your `config.json` file as a volume:

    -v /somewhere_on_host/config.json:/var/lib/data/auth0-adldap/config.json

For the initial configuration refer to the connector's documentation.

This docker image takes the config file you provide, copies it to `/opt/auth0-adldap/config.json`, and lets the connector take over it's management and changes.

Connector will also generate a key and a certificate for this agent. They are put in `/opt/auth0-adldap/certs/cert.key` and `/opt/auth0-adldap/certs/cert.pem`.

## HA configuration or subsequent runs

After the first run copy the certificate file and the config.json file back to host, and then use them instead of the initial one.

Copy the generated files over:

    docker cp your_docker_container:/opt/auth0-adldap/config.json /somewhere_on_host/config.json
    docker cp your_docker_container:/opt/auth0-adldap/certs /somewhere_on_host/certs

Then bind them instead of the initial ones:

    -v /somewhere_on_host/config.json:/var/lib/data/auth0-adldap/config.json
    -v /somewhere_on_host/certs/cert.key:/var/lib/data/auth0-adldap/certs/cert.key
    -v /somewhere_on_host/certs/cert.pem:/var/lib/data/auth0-adldap/certs/cent.pem
