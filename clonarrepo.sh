#!/usr/bin/env bash
#
# Este script clona un repositorio de GitHub en un directorio indicado.
#
# Este script espera recibir dos argumentos. En caso que no reciba dos argumentos
# buscara las variables que requiere del archivo de configuracion 'config.cfg'.
#
# En caso de recibir argumentos, El primer argumento es el link a GitHub para 
# descargar los archivos del repositorio. Estos archivos son los encargados de 
# hacer el monitoreo del servidor. 
#
# El segundo argumento es el directorio donde se hara el clonado del repositorio.
#
# AUTHOR: John Sanabria - john.sanabria@correounivalle.edu.co
# DATE: 2020-04-07
#
if [ ${#} -ne 2 ]; then
  . config.cfg
else # pasaron dos argumentos al script
  GITURL="${1}"
  DEPLOYDIR="${2}"
fi
git clone "${GITURL}" "${DEPLOYDIR}"
