用于创建用户并加入sudo权限
## Example Playbook

---
- hosts: all
  become: yes
  become_user: root
  gather_facts: no
  vars:
    app_user: app
  roles:
    - { role: user }
    - { role: sudo }
