#python

import lx
import sys
import math
import socket
import time



# Start of program
data = ''
host = ''
port = 47598
backlog = 5
size = 1024
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
running = True
sendAck = False
firstTimeThrough = True


def OutLog(logText):
	lx.out(logText)


# Bind to port loop
while 1:
	try:
		s.bind((host,port))
		break
	
	except:
		continue

s.listen(backlog)


# Main Program Loop
while running:
	if data != '':
		if data == "!!app.quit":
			running = False
		elif data.find("||ack||") != -1:
			data = ""
		elif data.find("||check||") != -1:
			data = ""
		else:
			lx.eval(data)
			sendAck = True
			firstTimeThrough = False
			data = ''

		while True:
			try:
				client.close()
				break
			except:
				continue


	try:
		client, address = s.accept()

		if firstTimeThrough == True:
			client.send("||init||")

		if sendAck == True:
			client.send("||ack||")
			sendAck = False
		
		data = client.recv(size)
		
	except:
		continue

			                     
	time.sleep(0.1)


lx.eval("!!app.quit")

"""
lx.eval("!scene.open {/Volumes/Main_Content/Content_Folders/AnimatedMusic/Modo/Test_Scenes/Color_Blocks/Color_Blocks_Out/Color_Blocks_Out.lxo}")
"""