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
ansible example -i example/inventory.txt -m 'shell' -a 'ls -la'
```
