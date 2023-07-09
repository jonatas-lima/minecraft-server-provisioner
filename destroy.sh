#!/bin/bash

source env/.env.$1 && cd terraform/$1 && terraform destroy -auto-approve && cd -
