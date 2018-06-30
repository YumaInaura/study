# Run

```
docker run -p 2222:22 -d ansible
```

```
# at first update your known hosts
ssh root@localhost -p 2222
```

```
# ansible command test
ansible example -i inventories/inventory.txt -m 'shell' -a 'ls -la'
```

```
# ansible-playbook command test
ansible-playbook -i inventories/inventory.txt playbooks/playbook.yml
```

