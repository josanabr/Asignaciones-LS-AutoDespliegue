#!/usr/bin/env bash
#
# Este script se encargara de desplegar los scripts que monitorean el estado
# de un servidor y los sube a thingspeak. Este script recibe como argumento el
# directorio donde se descargara el repositorio con los scripts para monitorear
# el estado de un servidor.
#
# AUTHOR: John Sanabria - john.sanabria@correounivalle.edu.co
# DATE: 2020-04-07
#
. config.cfg
BASEPATH=$(dirname "$(realpath ${0})")
CWD=$(pwd)
if [ ${#} -ne 1 ]; then
  DEPLOYMENTDIR="${GITDIR}"
else 
  DEPLOYMENTDIR="${1}"
fi
if [ ! -f ${BASEPATH}/${SCRIPTDIR}/config.cfg ]; then
  cp ${BASEPATH}/config.cfg ${BASEPATH}/${SCRIPTDIR}
  if [ $? -ne 0 ]; then
    echo "Problemas al copiar el archivo 'config.cfg'"
    exit 1
  fi
else
  diff ${BASEPATH}/config.cfg ${BASEPATH}/${SCRIPTDIR}/config.cfg > /dev/null
  if [ $? -ne 0 ]; then
    echo "Hay diferencias entre los archivo config.cfg y ${BASEPATH}/${SCRIPTDIR}/config.cfg"
    exit 1
  fi
fi
echo "Clonando repositorio [${GITURL}]... "
${BASEPATH}/${SCRIPTDIR}/clonarrepo.sh ${GITURL} ${DEPLOYMENTDIR} 
echo "Creando canal [${TSCHANNELNAME}]... "
${BASEPATH}/${SCRIPTDIR}/crearCanalTS.sh ${USERAPIKEYTS} ${TSCHANNELNAME} ${DEPLOYMENTDIR}
echo "Programando el script [${DEPLOYMENTDIR}/subirDatos.sh]... "
${BASEPATH}/${SCRIPTDIR}/programarCron.sh ${DEPLOYMENTDIR} subirDatos.sh
