#!/bin/bash

if [ ! -f "/rsync.sh" ]; then
  echo "copying default rsync script"
  cp /app/script/rsync.sh /config/
else
  echo "using existing rsync script"
fi

chown -R nobody:users /config
chmod -R g+rw /config
