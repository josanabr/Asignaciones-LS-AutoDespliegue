# README.md

En este repositorio se localizan los archivos que se requieren para desplegar scripts para el monitoreo de servidores.

Para probar este repositorio llevar a cabo las siguientes tareas:

## Clonar este repositorio

```
git clone 
```

## Personalizar archivo `config.cfg`

En el archivo `config.cfg` usted debe editar las siguientes *variables*:

* `GITURL`: esta variable debe contener el URL que usaría usted para clonar el repositorio donde tiene sus scripts para monitorear el estado de un servidor. 

* `USERAPIKEYS`: Esta variable debe tener el valor `User API Key` que usted encuentra en la págin de su perfil en ThingSpeak. [Click aquí](https://thingspeak.com/account/profile).

* `TSCHANNELNAME`: Esta variable debe contener el nombre que le quiere poner al canal donde registrará los datos del servidor monitoreado.

## Modificar scripts

A continuación se da una lista de las modificaciones que usted deberá hacer a algunos scripts en este repositorio:

* `scriptdir/clonarrepo.sh` en este archivo, en la línea 25, adicione el comando que usted usa regularmente para clonar un repositorio de GitHub desde la línea de comando.

* `scriptdir/crearCanalTS.sh` en este archivo usted debe modificar la línea 51 en la cual se pone en un archivo llamado `${DEPLOYMENTDIR}/config.cfg` la línea `TSWRITEKEY=<SU_CAMBIO_AQUI>`. La modificación que usted debe hacer es que debe reemplazar `<SU_CAMBIO_AQUI>` por la instrucción en Bash que le permite obtener el valor de una variable de Bash. La variable se llama `TSWRITEKEY` y fue inicializada en la línea 46 de este script. 

* `scriptdir/programarCron.sh` en este archivo usted debe modificar la línea 21. En esta línea usted debe escribir la sentencia de Bash que permite **adicionar** la cadena `* * * * * ${PATHNAME}` al archivo cuyo nombre se encuentra en la variable `TEMPFILE`. **IMPORTANTE** `TEMPFILE` es una variable y tiene el nombre del archivo. Recuerde que si quiere acceder al valor de una variable debe usar `${}`

## Ejecutar script `main.sh`
