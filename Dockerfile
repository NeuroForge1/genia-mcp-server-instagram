FROM node:16-alpine

# Establecer directorio de trabajo
WORKDIR /app

# Copiar solo los archivos necesarios
COPY index.js ./

# Verificar la estructura de directorios
RUN ls -la

# Instalar Python y pip para los scripts de Python
RUN apk add --no-cache python3 py3-pip && \
    echo "fastmcp>=0.1.0\ninstagrapi>=1.16.30" > requirements.txt && \
    pip3 install --no-cache-dir -r requirements.txt

# Exponer el puerto que utiliza la aplicación
EXPOSE 8000

# Comando para iniciar el servicio directamente con el archivo index.js existente
CMD ["node", "index.js"]
