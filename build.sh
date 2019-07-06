#!/bin/bash
docker build --iidfile iid .
RC=$?
if [ "$RC" != "0" ]; then
  echo "had error : $RC"
  exit
fi
docker tag $(cat iid) jokes
rm iid
