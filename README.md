# jokes
Docker image to serve fresh joke every second

# made this for testing, can be easily deployed to Kubernetes for scale
This image starts up a webserver with a new joke served every second. Useful for testing.

#Dockerfile
```
FROM alpine
RUN apk add curl apache2 fortune
EXPOSE 80
ADD updater.sh /tmp
ENTRYPOINT ["/tmp/updater.sh"]
```

# entrypoint.sh

```
#!/bin/sh
echo "booting" >/var/www/localhost/htdocs/index.html
if [ "$1" == "" ]; then
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
```
