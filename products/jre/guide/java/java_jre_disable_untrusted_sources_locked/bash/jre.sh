# platform = Java Runtime Environment
JAVA_PROPERTIES="/etc/.java/deployment/deployment.properties"
JAVA_DIR="/etc/.java/deployment"

# shellcheck disable=SC2174
mkdir -p -m 755 ${JAVA_DIR}

if [ ! -e ${JAVA_PROPERTIES} ]; then
  touch ${JAVA_PROPERTIES} && chmod 644 ${JAVA_PROPERTIES}
fi

grep -q "^deployment.security.askgrantdialog.notinca.locked$" ${JAVA_PROPERTIES}
if ! [ $? -eq 0 ] ; then
  echo "deployment.security.askgrantdialog.notinca.locked" >> ${JAVA_PROPERTIES}
fi
