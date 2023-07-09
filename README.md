# Minecraft Server Provisioner

## Objective

* Provision an [Minecraft](https://www.minecraft.net/) server where you and your friends can connect and play.

## Prerequisites

* [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
* [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
* Minecraft Client

### AWS

* An AWS account with access and secret keys, and the aws cli [installed](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-prereqs.html) and [configured](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)

### Hetzner

TODO

## How to

### Customization

If you want, you can customize some options on your Minecraft Server. To do it, you need to edit `./ansible/playbook.yml` minecraft-server role.

* `server_jar_url`: The server.jar file that will run the server. The version of this file must match the version of the Minecraft Client. (Default 1.20.1)

The other variables are self-explainable.

### Provision and Configure

1. Init terraform:

```bash
cd terraform/<aws | hetzner> && terraform init
```

2. Create, if not existent, an SSH key:

```bash
ssh-keygen
```

3. Config your credentials on `./env/.env.<aws | hetzner>`

4. Provision your server:

```bash
./provision.sh <aws | hetzner>
```

### Just Configure

If you already have a server, you can only run the ansible playbook that install and configure a Minecraft Server on your server.

1. Write the user that ansible will user and your IP address on `./ansible/hosts.ini`

2. Run:

```bash
cd ansible && ansible-playbook -i hosts.ini -v playbook.yml
```

### Destroy

If you want to destroy your Minecraft Server instances, just run:

```bash
./destroy.sh <aws | hetzner>
```

## Costs

TODO
