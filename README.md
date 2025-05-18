# Instagram MCP Server para GENIA

Un servidor MCP (Model Context Protocol) para Instagram que permite a GENIA interactuar con mensajes directos y otros recursos de Instagram.

## Características

- Autenticación con cookies de sesión de Instagram
- Operaciones sobre mensajes directos
- Lectura y envío de mensajes
- Integración con el orquestador MCP de GENIA
- Soporte para autenticación por usuario

## Requisitos

- Node.js 16+
- NPX
- Cookies de sesión de Instagram (session_id, csrf_token, ds_user_id)

## Instalación

### Usando NPX

```bash
npx instagram-dm-mcp@latest
```

### Ejecución

```bash
INSTAGRAM_SESSION_ID=your_session_id INSTAGRAM_CSRF_TOKEN=your_csrf_token INSTAGRAM_DS_USER_ID=your_ds_user_id npx instagram-dm-mcp@latest
```

## Operaciones Soportadas

### Mensajes Directos

- `get_recent_messages`: Obtiene mensajes recientes
- `get_thread_messages`: Obtiene mensajes de una conversación específica
- `send_message`: Envía un mensaje directo
- `send_image`: Envía una imagen en un mensaje directo
- `mark_as_seen`: Marca mensajes como vistos

### Usuarios

- `get_user_info`: Obtiene información de un usuario
- `search_users`: Busca usuarios por nombre o username
- `get_followers`: Obtiene seguidores de un usuario
- `get_following`: Obtiene usuarios seguidos por un usuario

## Integración con GENIA

Este servidor MCP está diseñado para integrarse con el orquestador MCP de GENIA, permitiendo que los usuarios conecten sus propias cuentas de Instagram y ejecuten operaciones a través de la interfaz unificada de GENIA.

### Ejemplo de Configuración en el Orquestador

```python
orchestrator.register_server(
    name="instagram",
    command=["npx", "instagram-dm-mcp@latest"],
    env_vars={
        "INSTAGRAM_SESSION_ID": "${INSTAGRAM_SESSION_ID}",
        "INSTAGRAM_CSRF_TOKEN": "${INSTAGRAM_CSRF_TOKEN}",
        "INSTAGRAM_DS_USER_ID": "${INSTAGRAM_DS_USER_ID}"
    }
)
```

## Manejo de Errores

El servidor incluye manejo robusto de errores para:

- Cookies de sesión inválidas o expiradas
- Límites de API excedidos
- Recursos no encontrados
- Errores de formato en solicitudes
- Bloqueos temporales por actividad sospechosa

Cada error incluye un código específico y un mensaje descriptivo para facilitar la depuración.

## Verificación de Dependencias

El servidor verifica automáticamente todas las dependencias necesarias al iniciar:

- Versión de Node.js
- Disponibilidad de NPX
- Validez de las cookies de sesión
- Conectividad con la API de Instagram

Si alguna dependencia falta o es incompatible, el servidor proporcionará instrucciones claras para resolverlo.

## Consideraciones de Seguridad

- Las cookies de sesión son credenciales sensibles y deben manejarse con cuidado
- Se recomienda utilizar cuentas dedicadas para automatización
- El uso excesivo de la API puede resultar en limitaciones temporales o permanentes
- Respetar los términos de servicio de Instagram

## Desarrollo

### Requisitos

- Node.js 16+
- npm o yarn

### Instalación de Dependencias

```bash
npm install
```

### Compilación

```bash
npm run build
```

### Pruebas

```bash
npm test
```

## Licencia

MIT

## Autor

GENIA Team
