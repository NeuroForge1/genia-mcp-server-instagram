FROM node:16-alpine

# Establecer directorio de trabajo
WORKDIR /app

# Copiar el archivo index.js desde el contexto de build
COPY index.js .

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
