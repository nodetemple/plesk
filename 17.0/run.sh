#!/bin/bash

echo "External IP: ${EXTERNAL_IP}"

/etc/init.d/psa startall
plesk bin ipmanage --reread
/etc/init.d/nginx start
exec plesk log --all
