# DemystData Challenge

This project uses a Packer template to provision a prebaked AMI containing the Apache web server based off of Amazon Linux. The AMI is then passed to a CloudFormation template as a parameter value.

## Requirements

* [Packer 1.1.2](http://www.packer.io)
* AWS CLI 1.12.1
* Bash

## Deployment

The following commands were used:

* First, create the prebaked AMI using the Packer template:
    * `packer build challenge.packer`
* Next, grab the Image ID of the created AMI and pass it into CloudFormation as a parameter.
	* `aws cloudformation create-stack --stack-name DemystData \`
	* `--template-body file://CF-Challenge.json \`
	* `--parameters ParameterKey=PackerAMI,ParameterValue=*Packer Image ID*`
	
## Files

* `./CF-Challenge.json` CloudFormation template.
* `./challenge.packer` Packer template.
* `./Scripts/apache.sh` Bash script to install and configure Apache.
