FROM node:16-alpine

# Instalar NPX si no está incluido en la imagen base
RUN npm install -g npx

# Establecer directorio de trabajo
WORKDIR /app

# Exponer el puerto que utiliza la aplicación
EXPOSE 8000

# Comando para iniciar el servicio
CMD ["npx", "instagram-dm-mcp@latest"]
