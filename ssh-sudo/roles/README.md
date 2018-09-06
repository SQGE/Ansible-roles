清单配置示例

[all:vars]
ansible_user=test
ansible_port=22222

[xx]
172.16.4.5 ansible_ssh_pass=123456 ansible_become_pass=123456 ansible_become_method=su 
172.16.4.6 ansible_ssh_pass=123456 ansible_become_pass=123456 ansible_become_method=su 
172.16.4.7 ansible_ssh_pass=123456 ansible_become_pass=123456 ansible_become_method=su 



执行

ansible-playbook  -i /inventory/test site.yml