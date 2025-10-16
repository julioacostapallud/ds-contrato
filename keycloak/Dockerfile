# Dockerfile optimizado para construcción local y deployment
FROM quay.io/keycloak/keycloak:23.0.6

# Copiar configuración del realm al contenedor
COPY realm-config/ /opt/keycloak/data/import/

# Construir Keycloak con configuración PostgreSQL
RUN JAVA_OPTS="-Xms128m -Xmx512m" /opt/keycloak/bin/kc.sh build --db=postgres

# Variables de entorno mínimas (las demás se pasan en runtime)
ENV JAVA_OPTS="-Xms16m -Xmx64m -XX:+UseSerialGC -XX:MaxGCPauseMillis=100"

# Comando de inicio
CMD ["start", "--optimized", "--import-realm"]
