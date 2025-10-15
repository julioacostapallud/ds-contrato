# 🚀 Guía de Deployment en Northflank

## Paso 1: Crear proyecto en Northflank

1. **Ve a**: [Northflank Console](https://app.northflank.com)
2. **Crear nuevo proyecto**:
   - Nombre: `ds-contrato-keycloak`
   - Tipo: **Service** (no Stack)

## Paso 2: Configuración del Service

### Source Configuration:
- **Source**: GitHub
- **Repository**: `julioacostapallud/ds-contrato`
- **Branch**: `main`
- **Build Context**: `keycloak/` ⚠️ **CRÍTICO**

### Build Configuration:
- **Build Type**: Docker Compose
- **Dockerfile Path**: `Dockerfile` (está en el directorio keycloak)
- **Port**: 8080

## Paso 3: Variables de entorno

Agregar estas variables en **Environment Variables**:

```bash
KEYCLOAK_ADMIN=admin
KEYCLOAK_ADMIN_PASSWORD=ds2025
KC_HOSTNAME=tu-app.northflank.app
KC_HTTP_ENABLED=true
NEON_DATABASE_URL=jdbc:postgresql://ep-billowing-sky-acrr21kk-pooler.sa-east-1.aws.neon.tech/neondb?sslmode=require
NEON_USER=neondb_owner
NEON_PASSWORD=npg_ULB8AQu5fojD
PORT=8080
```

## Paso 4: Configuración de red

- **HTTP Port**: 8080
- **Public URL**: Northflank la asignará automáticamente

## ✅ Verificación

Una vez desplegado:
1. Keycloak estará disponible en la URL asignada
2. Admin panel: `http://tu-url/admin`
3. Usuario: `admin`
4. Password: `ds2025`

## 🚨 Pasos importantes:

1. **Build Context** DEBE ser `keycloak/`
2. **KC_HOSTNAME** se actualizará automáticamente con la URL de Northflank
3. El Dockerfile incluye automáticamente la configuración del realm
