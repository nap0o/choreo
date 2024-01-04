#!/usr/bin/env bash

generate_pm2_file() {

  TLS=${NEZHA_TLS:+'--tls'}

  cat > /tmp/ecosystem.config.js << EOF
module.exports = {
  "apps":[
    {
      name: 'nezha',
      script: '/home/choreouser/nezha-agent',
      args: "-s ${NEZHA_SERVER}:${NEZHA_PORT} -p ${NEZHA_KEY} ${TLS}",
      out_file: "/dev/null",
      error_file: "/dev/null"
    }
  ]
}
EOF
}

generate_pm2_file
[ -e /tmp/ecosystem.config.js ] && pm2 start /tmp/ecosystem.config.js
