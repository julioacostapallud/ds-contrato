# Variables de Entorno para Deployment

## Variables Mínimas Necesarias en Northflank

```bash
# Admin credentials
KEYCLOAK_ADMIN=admin
KEYCLOAK_ADMIN_PASSWORD=ds2025

# Database configuration
KC_DB=postgres
KC_DB_URL=jdbc:postgresql://ep-billowing-sky-acrr21kk-pooler.sa-east-1.aws.neon.tech/neondb?sslmode=require&connectTimeout=30&socketTimeout=30
KC_DB_USERNAME=neondb_owner
KC_DB_PASSWORD=npg_ULB8AQu5fojD

# Hostname (actualizar con la URL real de Northflank)
KC_HOSTNAME=p01--keycloak--jwgm69gxznyt.code.run

# Memory optimization
JAVA_OPTS=-Xms16m -Xmx64m -XX:+UseSerialGC -XX:MaxGCPauseMillis=100

# Connection pool (opcionales, ya están en la imagen)
KC_DB_POOL_INITIAL_SIZE=1
KC_DB_POOL_MIN_SIZE=1
KC_DB_POOL_MAX_SIZE=2
KC_DB_POOL_MAX_LIFETIME=300
```

## Variables Opcionales

```bash
# Security settings
KC_HOSTNAME_STRICT_HTTPS=false
KC_HOSTNAME_STRICT_BACKCHANNEL=false

# Health check
KC_HEALTH_ENABLED=true

# Performance
KC_OPTIMIZED=true
```
