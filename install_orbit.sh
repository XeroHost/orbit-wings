#!/bin/bash

set -e

echo "Deteniendo Wings..."
systemctl stop wings 2>/dev/null || true

echo "Descargando Wings personalizado..."
curl -L -o /usr/local/bin/wings https://raw.githubusercontent.com/MauRoblesss/orbit-wings/main/wings
chmod +x /usr/local/bin/wings

echo "Iniciando Wings..."
systemctl start wings

echo "Instalando Nginx..."
apt update -y
apt install -y nginx

echo "Eliminando configuración default..."
rm -f /etc/nginx/sites-enabled/default
rm -f /etc/nginx/sites-available/default

echo "Eliminando página default..."
rm -f /var/www/html/index.nginx-debian.html

echo "Reiniciando Nginx..."
systemctl restart nginx

echo "Creando carpeta /srv/server_certs/ ..."
mkdir -p /srv/server_certs/

echo "Servidor limpio 🚀"
