# lb-master-slave-setup
The following setup demonstrate High-Availability postgresql database clustering. I use postgres database, and haproxy load balancer.


## Prerequisite

To run this on you computer, make sure you have [packer](https://www.packer.io/) & [terraform](https://www.terraform.io/) installed.

## Build AMI
Once you have cloned this repo locally, change into root directory, then run 

```bash 
cd /packer
```

Run

```bash
packer build <path/to/templates/filename.json>
```



## Terraform
Change directory into `/terraform/dev/`. The create `main.tf` file inside the dev folder. You should have a file close to:

```yaml
provider "aws" {
  region = "us-east-1"
}

module "my_vpc" {
  source           = "../modules/vpc/"
  vpc_cidr         = "172.31.0.0/24"
  vpc_id           = "${module.my_vpc.vpc_id}"
  priv_subnet_cidr = "172.31.0.0/25"
  pub_subnet_cidr  = "172.31.0.128/25"
  aws_access_key   = ""
  aws_secret_key   = ""
}

module "my_ec2" {
  source         = "../modules/ec2/"
  slave_count    = 2
  instance_type  = "t2.micro"
  priv_subnet_id = "${module.my_vpc.priv_subnet_id}"
  pub_subnet_id  = "${module.my_vpc.pub_subnet_id}"
  web_sg         = "${module.my_vpc.web_sg}"
  db_sg          = "${module.my_vpc.db_sg}"
  etcd_sg        = "${module.my_vpc.etcd_sg}"
}
```
*Note:* Please provide your `aws_access_key` and `aws_secret_key` from your AWS account. You should also have a `variable.tf` with your custom values, that is, `ami` of the AWS ami you build above.


Once the file is present, run
```bash
terraform plan
```

followed by 
```bash
terraform apply
```