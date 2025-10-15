# 🗄️ Configuración de Neon Database para Keycloak

## Paso 1: Crear base de datos en Neon

1. **Ir a [Neon Console](https://console.neon.tech/)**
2. **Crear nuevo proyecto**:
   - Nombre: `ds-contrato-keycloak` (o el que prefieras)
   - Database: `keycloak`
   - Región: Elegir la más cercana

3. **Obtener credenciales**:
   ```bash
   # URL completa de conexión (formato JDBC para Keycloak):
   NEON_DATABASE_URL=jdbc:postgresql://ep-xxxxx.us-east-2.aws.neon.tech/keycloak?sslmode=require
   
   # Usuario y password:
   NEON_USER=tudb_np_xxxxx  # Tu usuario generado
   NEON_PASSWORD=tu_password_generado
   ```

## Paso 2: Configurar variables de entorno

### Para Railway:
```bash
# En Railway Dashboard > Variables:
KEYCLOAK_ADMIN=admin
KEYCLOAK_ADMIN_PASSWORD=ds2025
KC_HOSTNAME=your-app-name.railway.app
KC_HTTP_ENABLED=true

# Neon DB (usar la URL completa):
NEON_DATABASE_URL=jdbc:postgresql://ep-xxxxx.us-east-2.aws.neon.tech/keycloak?sslmode=require
NEON_USER=tudb_np_xxxxx
NEON_PASSWORD=tu_password_generado

PORT=8080
```

### Para Render:
```bash
# En Render Dashboard > Environment Variables:
KEYCLOAK_ADMIN=admin
KEYCLOAK_ADMIN_PASSWORD=ds2025
KC_HOSTNAME=your-app-name.onrender.com
KC_HTTP_ENABLED=true

NEON_DATABASE_URL=jdbc:postgresql://ep-xxxxx.us-east-2.aws.neon.tech/keycloak?sslmode=require
NEON_USER=tudb_np_xxxxx
NEON_PASSWORD=tu_password_generado

PORT=8080
```

## Paso 3: Verificar configuración

El docker-compose.yml ya está configurado para usar:
- ✅ `KC_DB=postgres`
- ✅ `KC_DB_URL=${NEON_DATABASE_URL}`
- ✅ `KC_DB_USERNAME=${NEON_USER}`
- ✅ `KC_DB_PASSWORD=${NEON_PASSWORD}`

## ⚠️ Importante

- La URL de Neon **DEBE** incluir `sslmode=require`
- Keycloak automáticamente creará las tablas necesarias
- El realm se importará desde `realm-config/ds-2025-realm.json`

## 🚀 Probar conexión

Una vez desplegado, verifica que Keycloak se conecte correctamente:
- Login: `http://tu-dominio/admin`
- Usuario: `admin`
- Password: `ds2025`
