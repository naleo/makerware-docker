#! /bin/sh

## Start the backend service of Makerbot Desktop
/usr/bin/conveyor-svc --config /etc/conveyor.conf &
## Start Makerbot Desktop
makerware
