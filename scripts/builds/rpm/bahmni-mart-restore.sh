#!/usr/bin/env bash

#!/usr/bin/env bash

PATH_OF_CURRENT_SCRIPT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. ${PATH_OF_CURRENT_SCRIPT}/bahmni-mart-db-details.sh

read -p "Enter encrypted DB file location: " BACKUP_FILE_LOCATION

if [ -z "$BACKUP_FILE_LOCATION" ]; then
    echo "Please provide encrypted DB file location";
    exit 1:
fi

echo "Restoring  ${ANALYTICS_DB_NAME} with ${BACKUP_FILE_LOCATION}"

gpg --decrypt ${BACKUP_FILE_LOCATION} | psql -h ${ANALYTICS_DB_HOST} -p ${POSTGRESQL_PORT} -U ${ANALYTICS_DB_USERNAME} ${ANALYTICS_DB_NAME}

EXIT_CODE=$?
echo

if [ ${EXIT_CODE} == 0 ]; then
    echo "${ANALYTICS_DB_NAME} restore is successfully completed";
else
    echo "${ANALYTICS_DB_NAME} restore is failed"
    exit ${EXIT_CODE}
fi
