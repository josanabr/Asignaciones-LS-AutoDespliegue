#!/usr/bin/env bash
#
# Este script se encargara de desplegar los scripts que monitorean el estado
# de un servidor y los sube a thingspeak
#
# AUTHOR: John Sanabria - john.sanabria@correounivalle.edu.co
# DATE: 2020-04-07
#
if [ ${#} -ne 1 ]; then
  echo "Indique el directorio donde se instalara los scripts"
  exit 1
fi
CWD=$(pwd)
DEPLOYMENTDIR="${1}"
. config.cfg
./clonarrepo.sh ${GITURL} ${DEPLOYMENTDIR}/${GITDIR}
./crearCanalTS.sh ${USERAPIKEYTS} ${TSCHANNELNAME} ${DEPLOYMENTDIR}/${GITDIR}
./programarCron.sh "${DEPLOYMENTDIR}/${GITDIR}" subirDatos.sh
cd ${CWD}
