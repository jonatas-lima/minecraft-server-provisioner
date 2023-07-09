import json

with open('./output.json', 'r') as f:
    j = json.load(f)

    ansible_workers_ip = ''
    vm_ip = j['vm_public_ip']['value']

    ansible_hosts = f'''
[server]
{vm_ip}    ansible_user=ubuntu ansible_ssh_common_args='-o StrictHostKeyChecking=no'
'''.lstrip()

    with open('./ansible/hosts.ini', 'w') as hosts_ini:
        hosts_ini.write(ansible_hosts)
