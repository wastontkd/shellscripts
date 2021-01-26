 #!/bin/bash

DIR_MIN_SIZE=35000
DIR_PERCENT_BIG_MAX=23

DIR_COUNTER=0
BIG_DIR_COUNTER=0


for DIR in $(ls -l | grep '^d' | awk '{ print $NF }'); do
    DIR_COUNTER=$(expr ${DIR_COUNTER} +1)
    DIR_SIZE=$(du -sk ${DIR} | cut -f 1)
          if [ ${DIR_SIZE} -ge ${DIR_MIN_SIZE} ]; then
            BIG_DIR_COUNTER=$(expr ${BIG_DIR_COUNTER} +1)
          fi
done

if [ ${BIG_DIR_COUNTER} -gt 0]; then
    DIR_PERCENT_BIG=$(expr $(expr ${BIG_DIR_COUNTER} \* 100) ${DIR_COUNTER})
    if [${DIR_PERCENT_BIG} -gt ${DIR_PERCENT_BIG_MAX} ]; then
        echo "${DIR_PERCENT_BIG} percent of the directores are large tha ${DIR_MIN_SIZE} kilobytes."
    fi
fi

  