#!/usr/bin/env sh

echo "starting MongoDB"

mongod \
  --port ${SERVICE_PORT} \
  --dbpath ${SERVICE_HOME} \
  --logpath ${SERVICE_LOGFILE} \
  --logappend \
  -${SERVICE_LOGLEVEL} &

echo "please wait - live logging in 5 secs ..."
sleep 5
tail -f ${SERVICE_LOGFILE}

