# Dockerfile para despliegue en la nube (Railway, Render, etc.)
FROM quay.io/keycloak/keycloak:23.0.6

# Copiar configuración del realm al contenedor
COPY realm-config/ /opt/keycloak/data/import/

# Configurar variables de entorno para optimizar memoria (plan gratuito Northflank)
ENV JAVA_OPTS="-Xms16m -Xmx64m -XX:+UseSerialGC -XX:MaxGCPauseMillis=100"
ENV KC_OPTIMIZED=true
ENV KC_DB_POOL_INITIAL_SIZE=1
ENV KC_DB_POOL_MIN_SIZE=1
ENV KC_DB_POOL_MAX_SIZE=2

# Comando por defecto para importar realm y ejecutar Keycloak
CMD ["start", "--import-realm", "--optimized"]
