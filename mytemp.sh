#!/usr/bin/env python
#-*- coding: UTF-8 -*-

# autor: Carlos Rueda
# fecha: 2013-12-14
# mail: carlos.rueda@deimos-space.com

import time
import datetime
import os 
import logging, logging.handlers

########################################################################
LOG = "/var/www/temp/mytemp_diary.log"
LOG_FOR_ROTATE = 30

########################################################################

########################################################################
# definicion y configuracion de logs
try:
    logger = logging.getLogger('mytemp')
    loggerHandler = logging.handlers.TimedRotatingFileHandler(LOG , 'midnight', 1, backupCount=LOG_FOR_ROTATE)
    formatter = logging.Formatter('%(message)s')
    loggerHandler.setFormatter(formatter)
    logger.addHandler(loggerHandler)
    logger.setLevel(logging.DEBUG)
except Exception, error:
    print '------------------------------------------------------------------'
    print '[ERROR] Error writing log at %s' % error
    print '------------------------------------------------------------------'
    exit()
########################################################################

hora_actual = time.strftime("20%y/%m/%d %H:%M:%S", time.localtime())

fichero = open('/home/pi/temperatura/temp_actual.log', 'rb')
fichero2 = open('/home/pi/temperatura/temp_actual_corregida.log', 'w')
fichero_log = open('/home/pi/temperatura/mytemp.log', 'a')
#fichero_log2 = open('/opt/xbmc-bcm/xbmc-bin/share/xbmc/addons/webinterface.default/temp/mytemp_diary.log', 'a')

for line in fichero:
	temp_actual = float(line)

temp_corregida = float(temp_actual) - 1.1
fichero2.writelines(str(temp_corregida))
trama = hora_actual+","+str(temp_corregida)
fichero_log.writelines(trama+'\r\n')
#fichero_log2.writelines(trama)
logger.info(trama)

fichero.close
fichero2.close
fichero_log.close
#fichero_log2.close