#!/bin/bash

function provision_infra() {
  provider=$1

  source env/.env.$provider && \
      cd terraform/$provider && \
      terraform apply -auto-approve && \
      terraform output -json | tee ../../output.json && cd -
}

function config_ansible_hosts() {
  /usr/bin/python3 parse_tf_output.py
}

function config_vm() {
  cd ansible && ansible-playbook -i hosts.ini playbook.yml -v
}

provision_infra $1 && sleep 30 && config_ansible_hosts && config_vm
