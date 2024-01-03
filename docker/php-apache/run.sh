#!/usr/bin/bash
#
#  ██████╗  █████╗ ██╗  ██╗██████╗    ███╗   ██╗███████╗████████╗
# ██╔════╝ ██╔══██╗██║  ██║██╔══██╗   ████╗  ██║██╔════╝╚══██╔══╝
# ██║  ███╗███████║███████║██║  ██║   ██╔██╗ ██║█████╗     ██║
# ██║   ██║██╔══██║██╔══██║██║  ██║   ██║╚██╗██║██╔══╝     ██║
# ╚██████╔╝██║  ██║██║  ██║██████╔╝██╗██║ ╚████║███████╗   ██║
#  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝
#   ____  ___  _   _ ____
#  / ___|/ _ \| | | |  _ \   minions/docker/php-apache/run.sh
# | |  _| |_| | |_| | | | |
# | |_| |  _  |  _  | |_| |  Gustavo Huarcaya
#  \____|_| |_|_| |_|____/   https://gahd.net
#
# Runs qqta/php-apache Docker Container.
#
## Linux
# docker run -p 8090:80 -d qqta/php-apache
# docker run -p 8090:80 -d -v ~/Projects/www/html:/var/www/html/ qqta/php-apache
docker run -p 8090:80 -d -v $(pwd)/src:/var/www/html/ qqta/php-apache

## Windows
# docker run -p 8090:80 -d -v ${pwd}/src:/var/www/html/ qqta/php-apache

## docker-compose
# docker-compose up -d
