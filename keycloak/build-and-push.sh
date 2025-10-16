#!/bin/bash

# Script para construir y subir la imagen de Keycloak
set -e

# Variables configurables
IMAGE_NAME="keycloak-ds-contrato"
VERSION="latest"
REGISTRY_USER="julioacostapallud"  # Cambiar por tu usuario

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}🔨 Construyendo imagen de Keycloak...${NC}"
docker build -t ${IMAGE_NAME}:${VERSION} .

echo -e "${YELLOW}🏷️  Taggeando imagen para registry...${NC}"
docker tag ${IMAGE_NAME}:${VERSION} ${REGISTRY_USER}/${IMAGE_NAME}:${VERSION}

echo -e "${GREEN}✅ Imagen construida exitosamente${NC}"
echo -e "${YELLOW}📋 Comandos para subir a registry:${NC}"
echo ""
echo "Para Docker Hub:"
echo "  docker push ${REGISTRY_USER}/${IMAGE_NAME}:${VERSION}"
echo ""
echo "Para GitHub Container Registry:"
echo "  docker tag ${IMAGE_NAME}:${VERSION} ghcr.io/${REGISTRY_USER}/${IMAGE_NAME}:${VERSION}"
echo "  docker push ghcr.io/${REGISTRY_USER}/${IMAGE_NAME}:${VERSION}"
echo ""
echo -e "${YELLOW}🔧 Variables de entorno para Northflank:${NC}"
echo "KEYCLOAK_ADMIN=admin"
echo "KEYCLOAK_ADMIN_PASSWORD=ds2025"
echo "KC_HOSTNAME=[tu-hostname-de-northflank]"
echo "KC_DB=postgres"
echo "KC_DB_URL=[tu-url-de-neon]"
echo "KC_DB_USERNAME=[tu-usuario-neon]"
echo "KC_DB_PASSWORD=[tu-password-neon]"
echo "JAVA_OPTS=-Xms16m -Xmx64m -XX:+UseSerialGC -XX:MaxGCPauseMillis=100"
