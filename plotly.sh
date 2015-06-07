#!/usr/bin/env python
#-*- coding: UTF-8 -*-

# autor: Carlos Rueda
# mail: carlos.rueda@deimos-space.com

import time
import datetime
import os 
from plotly import *
import plotly
 
py = plotly("carlrue", "2p0af0rplf")
 
xp = []
yp = []

fichero = open('/var/www/temp/mytemp_diary.log', 'rb')
for line in fichero:
	datos = line.split(',')
	xp.append(datos[0])
	yp.append(datos[1])

response = py.plot(xp, yp, filename='Temperatura_salon', fileopt='overwrite')

url=response['url']
filename=response['filename']
print(url)
print(filename)

# Si estoy al final del dia creo la del backup diario
str_now = time.strftime("%H:%M:%S", time.localtime())
str_ref1 = "23:55:01"
str_ref2 = "23:59:59"

date_now = datetime.datetime.strptime(str_now, '%H:%M:%S')
date_ref1 = datetime.datetime.strptime(str_ref1, '%H:%M:%S')
date_ref2 = datetime.datetime.strptime(str_ref2, '%H:%M:%S')

if (date_now>date_ref1 and date_now<date_ref2):
	dia_actual = time.strftime("20%y%m%d", time.localtime())
	response = py.plot(xp, yp, filename=str(dia_actual)+'_Temperatura_salon', fileopt='overwrite')

