#!/bin/bash

# replace the frented params
#sed -i "s|API_BASE_URL=.*|API_BASE_URL='$BASEURL'|g" /usr/share/nginx/html/conf.js
#sed -i "s|SKYPEGMWCN_HOME_URL=.*|SKYPEGMWCN_HOME_URL='$HOMEURL'|g" /usr/share/nginx/html/conf.js
#sed -i "s|INVITATION_CODE_URL=.*|INVITATION_CODE_URL='$INVITATION_CODE_URL'|g" /usr/share/nginx/html/conf.js

# run nginx
exec /usr/sbin/nginx -g "daemon off;"

