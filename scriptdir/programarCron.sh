#!/usr/bin/env bash
#
# Este script se encarga de programar como una entrada de crontab la ejecucion
# periodica del script que llevara los datos del estado del servidor a la nube
#
# El primer argumento es el directorio donde reside el script y el segundo argumento
# es el nombre del script.
#
# AUTHOR: John Sanabria - john.sanabria@correounivalle.edu.co
# DATE: 2020-04-07
#
if [ ${#} -ne 2 ]; then
  echo "Pasar como argumentos "
  echo "Directorio donde esta el script a ejecutar"
  echo "Nombre del script"
else
  PATHNAME="${1}/${2}"
fi
TEMPFILE=$(mktemp)
crontab -l > ${TEMPFILE}
<SU_CAMBIO_AQUI>
crontab -u vagrant ${TEMPFILE}
