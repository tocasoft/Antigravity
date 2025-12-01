# Tocasoft - Sitio Web Dockerizado con Nginx

## 📋 Requisitos Previos

- Docker Desktop instalado y **ejecutándose**
- Git (para clonar el repositorio)

## 🚀 Configuración para Docker/Nginx

Este proyecto ahora está completamente configurado para Docker con Nginx. Los cambios incluyen:

### Archivos Creados/Modificados

1. **`nginx.conf`** - Configuración personalizada de Nginx que:
   - Elimina automáticamente las extensiones `.html` de las URLs
   - Habilita compresión gzip
   - Configura caché para archivos estáticos
   - Soporta el dominio `test.geniusdevelops.com`

2. **`Dockerfile`** - Actualizado para:
   - Copiar todos los archivos del proyecto
   - Incluir la configuración personalizada de Nginx
   - Usar Nginx Alpine (imagen ligera)

3. **`.dockerignore`** - Excluye archivos innecesarios del contenedor

4. **`.htaccess`** - ⚠️ **NOTA:** Este archivo NO se usa con Docker/Nginx (solo para Apache)

## 🛠️ Comandos para Desarrollo Local

### 1. Construir la imagen Docker

```bash
docker build -t tocasoft-web .
```

### 2. Ejecutar el contenedor

```bash
docker run -d -p 8081:80 --name mi-pagina-web tocasoft-web
```

### 3. Ver el sitio

Abre tu navegador en: `http://localhost:8081`

### 4. Detener el contenedor

```bash
docker stop mi-pagina-web
```

### 5. Eliminar el contenedor

```bash
docker rm mi-pagina-web
```

### 6. Ver logs del contenedor

```bash
docker logs mi-pagina-web
```

## 🐳 Usando Docker Compose (Recomendado)

El proyecto incluye `docker-compose.yml` para facilitar el despliegue:

```bash
# Iniciar el servicio
docker-compose up -d

# Detener el servicio
docker-compose down

# Ver logs
docker-compose logs -f
```

## 🌐 Despliegue en Hostinger

### Opción 1: Usando Docker (VPS/Cloud)

Si tienes un VPS o Cloud Hosting en Hostinger:

1. Conecta por SSH a tu servidor
2. Clona el repositorio:

   ```bash
   git clone https://github.com/tocasoft/Antigravity.git
   cd Antigravity
   ```

3. Ejecuta con Docker Compose:

   ```bash
   docker-compose up -d
   ```

### Opción 2: Hosting Compartido (cPanel)

Si usas hosting compartido:

1. **Sube los archivos HTML** directamente vía FTP/File Manager
2. **Usa el archivo `.htaccess`** (Apache lo leerá automáticamente)
3. **NO uses** los archivos Docker (Dockerfile, nginx.conf, docker-compose.yml)

## 📝 Características de Nginx

### URLs Limpias

- ✅ `http://tudominio.com/contacto` → muestra `contacto.html`
- ✅ `http://tudominio.com/servicios` → muestra `servicios.html`
- ❌ No necesitas escribir `.html` en la URL

### Compresión Gzip

Todos los archivos de texto (HTML, CSS, JS) se comprimen automáticamente para carga más rápida.

### Caché de Archivos Estáticos

Las imágenes, fuentes y archivos CSS/JS se cachean por 1 año para mejor rendimiento.

## 🔧 Solución de Problemas

### Error: "Docker daemon not running"

**Solución:** Inicia Docker Desktop antes de ejecutar comandos Docker.

### Error: "Port 8081 already in use"

**Solución:**

```bash
# Opción 1: Detén el contenedor existente
docker stop mi-pagina-web
docker rm mi-pagina-web

# Opción 2: Usa otro puerto
docker run -d -p 8082:80 --name mi-pagina-web tocasoft-web
```

### El sitio no carga correctamente

**Solución:**

```bash
# Ver logs del contenedor
docker logs mi-pagina-web

# Reiniciar el contenedor
docker restart mi-pagina-web
```

## 📂 Estructura del Proyecto

```
Antigravity/
├── index.html              # Página principal
├── nginx.conf              # Configuración de Nginx
├── Dockerfile              # Instrucciones para construir la imagen
├── docker-compose.yml      # Orquestación de contenedores
├── .dockerignore          # Archivos a excluir del contenedor
├── .htaccess              # Solo para Apache (hosting compartido)
└── README.md              # Este archivo
```

## 🆘 Soporte

Para problemas o preguntas, contacta a Tocasoft.

---

**Última actualización:** 2025-11-30
