# 🔑 Variables de entorno para tu proyecto Neon

## Variables extraídas de tu connection string:

```bash
# Admin Keycloak
KEYCLOAK_ADMIN=admin
KEYCLOAK_ADMIN_PASSWORD=ds2025

# Hostname (configurar según tu plataforma de deployment)
KC_HOSTNAME=tu-dominio.railway.app
KC_HTTP_ENABLED=true

# Neon Database Configuration
NEON_DATABASE_URL=jdbc:postgresql://ep-billowing-sky-acrr21kk-pooler.sa-east-1.aws.neon.tech/neondb?sslmode=require
NEON_USER=neondb_owner
NEON_PASSWORD=npg_ULB8AQu5fojD

# Puerto
PORT=8080
```

## 🚨 IMPORTANTE - Cambio necesario:

Tu base de datos se llama `neondb` (no `keycloak` como esperaba). Esto está perfecto y funcionará bien.

## Para Railway/Render/Railway:
Copia estas variables en tu dashboard de deployment.
