# plusHSM - Build an NGINX Plus Docker image with AWS CloudHSM integration

## Requirements

Initialized CloudHSM Cluster
* Add crypto user (CU) account for NGINX to authenticate to the HSM
* Download customerCA.crt (Issuing/signing certificate for your CloudHSM cluster)

Import the Private Key for your SSL Certificate into CloudHSM
* CloudHSM will return a “fake” private key to use in NGINX

## Getting Started

Copy these files into the same directory as the Dockerfile:
* nginx-repo.crt and nginx-repo.key -- For access to install NGINX Plus
* customerCA.crt -- The issuing/signing certificate for your CloudHSM cluster
* server.crt -- the SSL certificate for your web server
* server.key -- the "fake" PEM private key generated by CloudHSM

## How to Use

Build a Docker image using these files and deploy to an environment with access to the CloudHSM cluster's VPC

## Contributing

Please see the [contributing guide](https://github.com/nginx-architects/plusHSM/blob/main/CONTRIBUTING.md) for guidelines on how to best contribute to this project.

## License

[Apache License, Version 2.0](https://github.com/nginx-architects/plusHSM/blob/main/LICENSE)

&copy; [F5, Inc.](https://www.f5.com/) 2023
