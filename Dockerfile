FROM alpine
RUN apk add curl apache2 fortune
EXPOSE 80
ADD updater.sh /tmp
ENTRYPOINT ["/tmp/updater.sh"]
