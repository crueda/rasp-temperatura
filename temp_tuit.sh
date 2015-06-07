#!/usr/bin/env python
#-*- coding: UTF-8 -*-

# autor: Carlos Rueda
# fecha: 2013-12-14
# mail: carlos.rueda@deimos-space.com

import tweetpony
import time
import datetime

hora_actual = time.strftime("20%y %m %d - %H %M %S", time.localtime())
fichero = open('/home/pi/temperatura/temp_actual_corregida.log', 'rb')
for line in fichero:
	temp_actual = line

api = tweetpony.API(consumer_key = "6EaicoNVcrFuSWdXtSQ", consumer_secret = "3393Vi6IItFioRmfmvNIuB0r0zYHQjZVxd78Yk", access_token = "469243869-zxAMSEsLYFKorOhpn81t14qPPEmGMb3aigR7OeB2", access_token_secret = "WXTKgp85Ed7jK6bHxpzXp8ZAn8l0Tldpc3OeRG6zZ7Tam")
user = api.user
#print "Hello, @%s!" % user.screen_name
#text = raw_input("What would you like to tweet? ")

tuit = hora_actual + ": Temperatura->" + temp_actual

try:
    api.update_status(status = tuit)
except tweetpony.APIError as err:
    print "Oops, something went wrong! Twitter returned error #%i and said: %s" % (err.code, err.description)
else:
    print "Yay! Your tweet has been sent!"

