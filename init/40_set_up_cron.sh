#!/bin/bash

if [ ! -f "/config.txt" ]; then
  echo "copying default rsync script"
  cp /app/script/rsync.sh /config/
else
  echo "using existing rsync script"
fi

chown -R nobody:users /config
chmod -R g+rw /config
