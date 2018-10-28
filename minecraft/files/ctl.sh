#!/bin/bash

minecraft_user=minecraft
minecraft_dir=/var/minecraft
server_type="${1}"
instance_name="${2}"
instance_dir="${minecraft_dir}/${server_type}/instances/${instance_name}"

if [[ ! -d ${minecraft_dir} ]]; then
  echo "Error: Minecraft directory '${minecraft_dir}' does not exist."
  exit -1
fi
if [[ ! -d ${minecraft_dir}/${server_type} ]]; then
  echo "Error: Server type '${server_type}' does not exist."
  exit -1
fi
if [[ ! -d ${instance_dir} ]]; then
  echo "Error: Instance '${server_type}' does not exist."
  exit -1
fi
cd ${instance_dir}
bash start.sh
