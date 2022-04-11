#! bin/bash

nginx -g 'daemon off;' &

resume serve --theme elegant &

wait -n

exit $?
