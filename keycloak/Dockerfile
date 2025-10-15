# Dockerfile para despliegue en la nube (Railway, Render, etc.)
FROM quay.io/keycloak/keycloak:23.0.6

# Copiar configuración del realm al contenedor
COPY realm-config/ /opt/keycloak/data/import/

# Configurar variables de entorno para optimizar memoria
ENV JAVA_OPTS="-Xms128m -Xmx512m -XX:+UseG1GC"

# Comando por defecto para importar realm y ejecutar Keycloak
CMD ["start", "--import-realm"]
