FROM node:16-alpine

# Establecer directorio de trabajo
WORKDIR /app

# Instalar git para clonar el repositorio
RUN apk add --no-cache git

# Clonar el repositorio completo dentro del contenedor
RUN git clone https://github.com/NeuroForge1/genia-mcp-server-instagram.git /tmp/repo

# Copiar todos los archivos del repositorio al directorio de trabajo
RUN cp -r /tmp/repo/* /app/ && \
    rm -rf /tmp/repo

# Verificar la estructura de directorios
RUN ls -la

# Instalar Python y pip para los scripts de Python
RUN apk add --no-cache python3 py3-pip && \
    pip3 install --no-cache-dir -r requirements.txt

# Exponer el puerto que utiliza la aplicación
EXPOSE 8000

# Comando para iniciar el servicio
CMD ["node", "index.js"]
