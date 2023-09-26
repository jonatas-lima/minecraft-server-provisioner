#!/bin/bash

function provision_infra() {
  provider=$1

  source env/.env.$provider && \
      cd terraform/$provider && \
      opentofu init && \
      opentofu apply -auto-approve && \
      opentofu output -json | tee ../../output.json && cd -
}

function config_ansible_hosts() {
  provider=$1

  /usr/bin/python3 parse_tf_output.py $provider
}

function config_vm() {
  ansible-galaxy collection install community.general && cd ansible && ansible-playbook -i hosts.ini playbook.yml -v
}

PROVIDER=$1

provision_infra $PROVIDER && sleep 30 && config_ansible_hosts $PROVIDER && config_vm
