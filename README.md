# 08.05 Тестирование Roles

Данный playbook выполняет установк элементов ELK-стека на три отедльных хоста.

Адреса хостов, на которые будут устанволены  elasticsearch, kibana, filebeat  прописываются в файле inventory/prod/hosts.yml.

Описание ролей находится в файле requirements.yml. Роли необходимо предварительно скачать.

Скачивание ролей в папку *roles/* выполняетcя командой:
```
ansible-galaxy install -r requirements.yml -p roles
```

Playbook запускается командой:

```
ansible-playbook -i inventory/prod/ site.yml
```

