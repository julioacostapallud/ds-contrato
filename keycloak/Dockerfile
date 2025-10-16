# Dockerfile para despliegue en la nube (Railway, Render, etc.)
FROM quay.io/keycloak/keycloak:23.0.6

# Copiar configuración del realm al contenedor
COPY realm-config/ /opt/keycloak/data/import/

# Construir Keycloak con configuración PostgreSQL (más memoria para build)
RUN JAVA_OPTS="-Xms128m -Xmx512m" /opt/keycloak/bin/kc.sh build --db=postgres

# Configurar variables de entorno para optimizar memoria y conexión DB
ENV JAVA_OPTS="-Xms16m -Xmx64m -XX:+UseSerialGC -XX:MaxGCPauseMillis=100"
ENV KC_DB_POOL_INITIAL_SIZE=1
ENV KC_DB_POOL_MIN_SIZE=1
ENV KC_DB_POOL_MAX_SIZE=2
ENV KC_DB_POOL_MAX_LIFETIME=300

# Configuración adicional para Quarkus/Hibernate
ENV QUARKUS_TRANSACTION_MANAGER_ENABLE_RECOVERY=true
ENV QUARKUS_AGROAL_RECOVERY_INTERVAL=PT30S
ENV QUARKUS_AGROAL_VALIDATION_QUERY_SQL="SELECT 1"
ENV QUARKUS_AGROAL_MAX_LIFETIME=PT5M

# Comando de inicio optimizado
CMD ["start", "--optimized", "--import-realm"]
