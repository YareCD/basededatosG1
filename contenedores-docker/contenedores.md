# Contenedores de sistemas gestores de Base de Datos
![Docker](./img/logotipo%20Docker.png)
## Imagenes 

> Comandos para cada imagen 

- Descargar imagen postgres

```
docker pull postgres:14.22-trixie
```
- Descargar imagen de tutorial de Docker
```
docker pull docker/getting-started
```
## Creación de contenedores 
```
docker run -d -p 80:80 **Nombre o Codigo de la Imagen**
```
donde : 
- -d detach (background)
- -p puerto (el primer numero de puerto no se cambia, el segundo si podemos cambiarlo)

### Contenedor de Tutorial de Docker
```
docker run -d -p 80:80 docker/getting-started:latest

docker run -d -p 80:8090 d7933
```

### Contenedor de Mariadb sin volumen
```
    docker run -d --name Server-MariadbG1 
-p 3343:3306 -e MARIADB_ROOT_PASSWORD=123456
e0236

 nombre o id de la imagen 
```

### Contenedor de Mariadb con volumen
``` docker
docker volume create v-mariadbg1

```
### Contenedor de Postgres con volumen
``` docker
docker volume create v-postgresg1

docker run -d --name Server-PostgresG1 -p 5455:5432 -e POSTGRES_PASSWORD=123456 -v v-postgresg1:/var/lib/postgres/data bbb88 

```

## Comandos de Docker

| Comando | Descripción |
|-----------|-----------|
| **docker --version**   | _Muestra la version del docker_    |
| **docker --pull nombre_imagen**   | _Descargar una imagen de docker Hub_  [docker](https://hub.docker.com)  |
| **docker images**   | _Muestra las imagenes_ |
| **docker run**   | _Permite crear un contenedor_ |
| **docker ps**   | _Visualiza los contenedores que estan en acción_ |
| **docker container ls**   | _Visualiza los contenedores que estan en acción_ |
| **docker container ls -a**   | _Visualiza todos los contenedores_ |
| **docker ps -a**   | _Visualiza todos los contenedores_ |
| **docker rm nombre del contenedor o id**   | _Borra un contendor que no esta en ejecución_ |
| **docker rm -f nombre del contenedor o id**   | _Borra un contendor que esta en ejecución_ |
| **docker start**   | _Inicia un contendor_ |
| **docker stop**   | _Detiene un contendor_ |
| **docker volume ls**   | _Mostrar los volumenes que existen en Docker_ |



Usuarios con mayores privilegios 
root > postgres

sql > superadmin





