# 🔧 Variables de entorno optimizadas para Northflank

## Problema identificado:
- Exit code 137 = Proceso terminado por falta de memoria
- Keycloak necesita más memoria configurada

## Variables de entorno CORRECTAS para Runtime variables:

```bash
# Admin Keycloak
KEYCLOAK_ADMIN=admin
KEYCLOAK_ADMIN_PASSWORD=ds2025

# Hostname (Northflank asignará automáticamente)
KC_HOSTNAME=localhost
KC_HTTP_ENABLED=true

# Configuración de base de datos Neon
KC_DB=postgres
KC_DB_URL=jdbc:postgresql://ep-billowing-sky-acrr21kk-pooler.sa-east-1.aws.neon.tech/neondb?sslmode=require
KC_DB_USERNAME=neondb_owner
KC_DB_PASSWORD=npg_ULB8AQu5fojD

# Configuración optimizada de Keycloak
KC_HOSTNAME_STRICT_BACKCHANNEL=false
KC_HOSTNAME_STRICT_HTTPS=false
KC_HEALTH_ENABLED=true

# Optimización de memoria (CRÍTICO)
JAVA_OPTS=-Xms128m -Xmx512m -XX:+UseG1GC
KC_PROXY=edge

# Puerto
PORT=8080
```

## 🚨 Variables CRÍTICAS que faltaban:

Agregar estas variables que Keycloak necesitaba:
- `KC_DB=postgres`
- `KC_PROXY=edge`
- `JAVA_OPTS=-Xms128m -Xmx512m -XX:+UseG1GC`
