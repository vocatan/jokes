#!/bin/bash
echo "Starting jokes, running in port 9000"
docker run -d --name jokes  --rm -p 9000:80 jokes
echo "now running: go to http://localhost:9000"
