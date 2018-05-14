#  Project Alpha                                     

Script en Bash para el Analisis por SNMP de los equipos gestionados de Cemex.

El script devuelve el uptime del router y de la BGP primaria, para poder analizar rapidamente la causa de la incidencia.

---

## Informacion:

pensado para ser lanzado desde la consola de MNS Cemex.

Se tiene que introducir el mnemonico recortardo (PAIS-SITEID)

---

## Futuro:

1. Añadir que en el output te devuelva si es corte electrico o no.
2. Añadir el analisis del uptime de Tunneles DMVPN.
   - Añadir alguna funcion para que dependiendo del site devuelva el output de la BGP o del DMVPN (dependiendo del tipo de Sitio)
3. Añadir show logs (si es viable)

---

Testing
