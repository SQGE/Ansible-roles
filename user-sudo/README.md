用于初始化
1.创建用户 vars app_user
2.加入sudo权限
3.加入免密






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
     - { role: ssh }
