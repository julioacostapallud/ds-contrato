# Dockerfile para despliegue en la nube (Railway, Render, etc.)
FROM quay.io/keycloak/keycloak:23.0.6

# Copiar configuración del realm al contenedor
COPY realm-config/ /opt/keycloak/data/import/

# Configurar variables de entorno para optimizar memoria (reducido para planes gratuitos)
ENV JAVA_OPTS="-Xms64m -Xmx256m -XX:+UseG1GC -XX:MaxGCPauseMillis=200"

# Comando por defecto para importar realm y ejecutar Keycloak
CMD ["start", "--import-realm"]
