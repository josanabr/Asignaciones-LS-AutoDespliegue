#!/usr/bin/env bash
#
# Este script lleva a cabo la creacion de un canal en ThingSpeak. Requiere tres
# argumentos. El primer argumento son las llaves del usuarion en la plataforma
# ThingSpeak.
#
# El segundo argumento hace referencia al canal que se quiere crear en la
# plataforma ThingSpeak. 
#
# El tercer argumento es el directorio donde estan alojados los scripts que 
# monitorean los servidores. En este directorio se ubicara el archivo configuracion
# 'config.cfg' que usa el script que hara la carga de los archivos a la plataforma
# ThingSpeak.
#
# AUTHOR: John Sanabria - john.sanabria@correounivalle.edu.co
# DATE: 2020-04-07
#
if [ ${#} -ne 3 ]; then
  echo "Este script espera recibir tres argumentos"
  echo "1er arg: Llave de usuario para crear canal en ThingSpeak"
  echo "2do arg: Nombre del canal a ser creado"
  echo "3er arg: Dir donde estan los scripts de monitoreo"
  exit 1
fi
USERAPIKEYTS="${1}"
TSCHANNELNAME="${2}"
DEPLOYMENTDIR="${3}"
TEMPFILE=$(mktemp)
#
# Se hizo necesario crear una cadena con el programa 'jq' que contuviera
# un diccionario tipo JSON
#
JSONSTRING=$( jq -n \
                  --arg ua "$USERAPIKEYTS" \
                  --arg cn "$TSCHANNELNAME" \
                  '{api_key: $ua, name: $cn, "field1": "ram"}' )
#
# La salida del comando 'curl', que es un JSON file, queda en el archivo 
# '${TEMPFILE}'
#
curl -o ${TEMPFILE} --header "Content-Type: application/json"   --request POST   --data "$(echo $JSONSTRING)"  https://api.thingspeak.com/channels.json
#
# Se lee el archivo '${TEMP}' y se obtiene la llave que permite escribir datos
# al canal de ThingSpeak.
#
TSWRITEKEY=$(jq '.api_keys[0].api_key' ${TEMPFILE})
#
# Se guarda dicha llave en el archivo de configuracion que leera el script
# que subira los datos ThingSpeak.
#
echo "TSWRITEKEY=${TSWRITEKEY}" > ${DEPLOYMENTDIR}/config.cfg
