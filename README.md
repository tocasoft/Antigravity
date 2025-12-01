# Guía de Despliegue en Hostinger (VPS)

Este proyecto contiene una página web simple contenerizada con Docker.

## Archivos
- `index.html`: La página web.
- `Dockerfile`: Instrucciones para construir la imagen.
- `docker-compose.yml`: Configuración para correr el contenedor fácilmente.

## Paso a Paso para Hostinger VPS

### 1. Requisitos Previos
- Tener un plan VPS en Hostinger (Ubuntu 20.04 o 22.04 recomendado).
- Acceso SSH al servidor.

### 2. Conectarse al VPS
Usa tu terminal (PowerShell o CMD):
```bash
ssh root@tu_ip_vps
```

### 3. Instalar Docker (si no está instalado)
Ejecuta estos comandos en tu VPS:
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
# Instalar Docker Compose
apt install docker-compose -y
```

### 4. Subir los archivos
Puedes subir los archivos usando SCP desde tu computadora local (en la carpeta donde están estos archivos):
```bash
scp index.html Dockerfile docker-compose.yml root@tu_ip_vps:/root/mi-web/
```
*Nota: Reemplaza `tu_ip_vps` con la IP real de tu servidor.*

### 5. Ejecutar el contenedor
Vuelve a tu terminal SSH en el VPS, ve a la carpeta y ejecuta:
```bash
cd /root/mi-web
docker-compose up -d
```

¡Listo! Tu web debería estar visible en `http://tu_ip_vps:8080`.

Si quieres que salga en el puerto 80 (directo sin :8080), edita el `docker-compose.yml` y cambia `"8080:80"` por `"80:80"`.
