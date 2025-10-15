# Dockerfile para despliegue en la nube (Railway, Render, etc.)
FROM quay.io/keycloak/keycloak:23.0.6

# Copiar configuración del realm al contenedor
COPY realm-config/ /opt/keycloak/data/import/

# Construir Keycloak con configuración PostgreSQL (más memoria para build)
RUN JAVA_OPTS="-Xms128m -Xmx512m" /opt/keycloak/bin/kc.sh build --db=postgres

# Configurar variables de entorno para optimizar memoria en runtime (plan gratuito Northflank)
ENV JAVA_OPTS="-Xms16m -Xmx64m -XX:+UseSerialGC -XX:MaxGCPauseMillis=100"

# Comando de inicio optimizado
CMD ["start", "--optimized", "--import-realm"]
