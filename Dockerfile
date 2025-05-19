FROM node:16-alpine

# Establecer directorio de trabajo
WORKDIR /app

# Instalar git para clonar el repositorio
RUN apk add --no-cache git

# Clonar el repositorio completo dentro del contenedor
RUN git clone https://github.com/NeuroForge1/genia-mcp-server-instagram.git /tmp/repo

# Copiar manualmente los archivos esenciales del repositorio
RUN if [ -f /tmp/repo/index.js ]; then cp /tmp/repo/index.js /app/; fi && \
    if [ -f /tmp/repo/package.json ]; then cp /tmp/repo/package.json /app/; fi && \
    if [ -f /tmp/repo/package-lock.json ]; then cp /tmp/repo/package-lock.json /app/; fi && \
    if [ -f /tmp/repo/server.py ]; then cp /tmp/repo/server.py /app/; fi && \
    if [ -f /tmp/repo/cli.js ]; then cp /tmp/repo/cli.js /app/; fi && \
    if [ -f /tmp/repo/postinstall.js ]; then cp /tmp/repo/postinstall.js /app/; fi && \
    if [ -f /tmp/repo/setup.js ]; then cp /tmp/repo/setup.js /app/; fi && \
    if [ -d /tmp/repo/node_modules ]; then cp -r /tmp/repo/node_modules /app/; fi && \
    rm -rf /tmp/repo

# Crear explícitamente el archivo requirements.txt
RUN echo "fastmcp>=0.1.0\ninstagrapi>=1.16.30" > requirements.txt

# Verificar la estructura de directorios
RUN ls -la

# Instalar Python y pip para los scripts de Python
RUN apk add --no-cache python3 py3-pip && \
    pip3 install --no-cache-dir -r requirements.txt

# Exponer el puerto que utiliza la aplicación
EXPOSE 8000

# Comando para iniciar el servicio
CMD ["node", "index.js"]
