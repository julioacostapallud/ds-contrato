# Dockerfile para despliegue en la nube (Railway, Render, etc.)
FROM quay.io/keycloak/keycloak:23.0.6

# Copiar configuración del realm al contenedor
COPY realm-config/ /opt/keycloak/data/import/

# Configurar variables de entorno para optimizar memoria (plan gratuito Northflank)
ENV JAVA_OPTS="-Xms16m -Xmx64m -XX:+UseSerialGC -XX:MaxGCPauseMillis=100"

# Construir Keycloak con configuración PostgreSQL
RUN /opt/keycloak/bin/kc.sh build --db=postgres

# Comando de inicio optimizado
CMD ["start", "--optimized", "--import-realm"]
