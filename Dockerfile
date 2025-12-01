# Usar una imagen base ligera de Nginx
FROM nginx:alpine

# Copiar todos los archivos al directorio predeterminado de Nginx
COPY . /usr/share/nginx/html/

# Copiar la configuración personalizada de Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Exponer el puerto 80
EXPOSE 80

# Comando para iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]
