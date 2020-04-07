#!/usr/bin/env bash
#
# Este script clona un repositorio de GitHub en un directorio indicado.
#
# Este script espera recibir un argumento. En caso que no reciba dicho argumento
# buscara la variable 'GITURL' en el archivo de configuracion 'config.cfg'.
#
# En caso de recibir el argumento, este argumento representa el link a GitHub para 
# descargar los archivos del repositorio. Estos archivos son los encargados de 
# hacer el monitoreo del servidor. 
#
# AUTHOR: John Sanabria - john.sanabria@correounivalle.edu.co
# DATE: 2020-04-07
#
if [ ${#} -ne 1 ]; then
  . config.cfg
else # pasaron dos argumentos al script
  GITURL="${1}"
fi
git clone "${GITURL}" 
