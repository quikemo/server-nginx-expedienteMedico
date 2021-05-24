#!/bin/bash
docker run -p 91:80 -d --rm --name nodo1 web-expediente-medico
docker run -p 92:80 -d --rm --name nodo2 web-expediente-medico
exit
