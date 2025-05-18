FROM node:16-alpine

# Establecer directorio de trabajo
WORKDIR /app

# Copiar archivos del repositorio (que Render ya clonó)
COPY . .

# Instalar dependencias
RUN npm install

# Instalar Python y pip para los scripts de Python
RUN apk add --no-cache python3 py3-pip && \
    pip3 install -r requirements.txt

# Exponer el puerto que utiliza la aplicación
EXPOSE 8000

# Comando para iniciar el servicio
CMD ["node", "index.js"]
