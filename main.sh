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
if [ ${#} -ne 1 ]; then
  DEPLOYMENTDIR="${GITDIR}"
else 
  DEPLOYMENTDIR="${1}"
fi
./clonarrepo.sh ${GITURL} ${DEPLOYMENTDIR}
./crearCanalTS.sh ${USERAPIKEYTS} ${TSCHANNELNAME} ${DEPLOYMENTDIR}
./programarCron.sh ${DEPLOYMENTDIR} subirDatos.sh
