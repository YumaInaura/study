# docker run container

```
docker build . -t ansible
docker run -p 2222:22 -d ansible
```

or run from dockerhub 

```
docker run -d -p 2222:22 yumainaura/ansible-ssh
```

# ssh access directly

```
ssh root@localhost -p 2222
```

# ansible command test

```
ansible example -i inventories/inventory.txt -m 'shell' -a 'ls -la'
```

## ansible-playbook command test

```
ansible-playbook -i inventories/inventory.txt playbooks/playbook.yml
```

