#!/bin/sh
echo "booting" >/var/www/localhost/htdocs/index.html
if [ "$1" == "" ]; then
  # parent
  echo "PARENT: calling to run updater in background.."
  $0 updater &

  echo "PARENT: starting webserver in foreground."
  /usr/sbin/httpd -D FOREGROUND
  exit
else
  echo "CHILD: making jokes once per second"
  while true; do
    fortune >/var/www/localhost/htdocs/index.html
    sleep 1
  done
fi


