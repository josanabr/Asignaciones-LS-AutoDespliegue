#!/usr/bin/env bash
#
# Este script clona un repositorio de GitHub en un directorio indicado.
#
# Este script espera recibir dos argumentos. En caso que no recibir dichos 
# argumentos los buscara en el archivo de configuracion 'config.cfg'.
#
# En caso de recibir los argumento, el 1er argumento representa el link a GitHub 
# para descargar los archivos del repositorio. Estos archivos son los encargados 
# de hacer el monitoreo del servidor. 
#
# El segundo argumento es el directorio donde se descargara el repositorio.
#
# AUTHOR: John Sanabria - john.sanabria@correounivalle.edu.co
# DATE: 2020-04-07
#
if [ ${#} -ne 2 ]; then
  . config.cfg
else # pasaron dos argumentos al script
  GITURL="${1}"
  GITDIR="${2}"
fi
# Escriba aqui el comando de 'git' que permita clonar un repositorio. 
# Ese comando recibiria dos argumentos los cuales son: ${GITURL} y ${GITDIR}.
<SU_CAMBIO_AQUI>
echo $?
