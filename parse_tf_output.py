import json
import sys


class UnsupportedProviderException(Exception):
    def __init__(self, *args: object) -> None:
        super().__init__(*args)


provider = sys.argv[1]

PROVIDER_USER_MAP = {
    'aws': 'ubuntu',
    'openstack': 'ubuntu',
    'hetzner': 'root',
    'gcp': 'ubuntu'
}

user = PROVIDER_USER_MAP.get(provider)

if user is None:
    raise UnsupportedProviderException('Unsupported provider')

with open('./output.json', 'r') as f:
    j = json.load(f)

    ansible_workers_ip = ''
    vm_ip = j['vm_public_ip']['value']

    ansible_hosts = f'''
[server]
{vm_ip}    ansible_user={user} ansible_ssh_common_args='-o StrictHostKeyChecking=no'
'''.lstrip()

    with open('./ansible/hosts.ini', 'w') as hosts_ini:
        hosts_ini.write(ansible_hosts)
