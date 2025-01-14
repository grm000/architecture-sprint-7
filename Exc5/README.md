### Применяем конфиг сети:
```
kubectl apply -f non-admin-api-allow.yml
```
### Запуск сервисов с метками:
```
./create_services.sh
```
### Проверяем работоспособность

```
kubectl run test-$RANDOM --rm -i -t --image=alpine -- wget -qO- --timeout=2 http://back-end-api-app 
```
#### результат:
```
wget: download timed out
```
### Высвобождаем ресурсы
```
./purge_pods_and_services.sh
```