#!/usr/bin/bash
#
#  ██████╗  █████╗ ██╗  ██╗██████╗    ███╗   ██╗███████╗████████╗
# ██╔════╝ ██╔══██╗██║  ██║██╔══██╗   ████╗  ██║██╔════╝╚══██╔══╝
# ██║  ███╗███████║███████║██║  ██║   ██╔██╗ ██║█████╗     ██║
# ██║   ██║██╔══██║██╔══██║██║  ██║   ██║╚██╗██║██╔══╝     ██║
# ╚██████╔╝██║  ██║██║  ██║██████╔╝██╗██║ ╚████║███████╗   ██║
#  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝
#   ____  ___  _   _ ____
#  / ___|/ _ \| | | |  _ \   minions/docker/sql-server/run.sh
# | |  _| |_| | |_| | | | |
# | |_| |  _  |  _  | |_| |  Gustavo Huarcaya
#  \____|_| |_|_| |_|____/   https://gahd.net
#
# Runs MS SQL Server Docker Container.
#
## Linux
# https://learn.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-ver16&pivots=cs1-bash
#
sudo docker pull mcr.microsoft.com/mssql/server:2022-latest

# Your password should follow the SQL Server default password policy, otherwise
# the container can't set up SQL Server and will stop working. By default, the
# password must be at least eight characters long and contain characters from
# three of the following four sets: uppercase letters, lowercase letters,
# base-10 digits, and symbols. You can examine the error log by using the
# docker logs command.
sudo docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=YourStrong@Passw0rd" \
   -p 1433:1433 --name sql1 --hostname sql1 \
   -d \
   mcr.microsoft.com/mssql/server:2022-latest

## Windows
# https://learn.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-ver16&pivots=cs1-powershell
#
# docker pull mcr.microsoft.com/mssql/server:2022-latest

# docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=YourStrong@Passw0rd" `
#    -p 1433:1433 --name sql1 --hostname sql1 `
#    -d `
#    mcr.microsoft.com/mssql/server:2022-latest

## docker-compose
# docker-compose up -d
