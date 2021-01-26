 ${PRINT_DIR_MIN}=0;
 for DIR in $(ls -l | grep '^d' | awk '{ print $NF }'); do
  2         DIR_SIZE=$(du -sk ${DIR} | cut -f 1)
  3         if [ ${DIR_SIZE} -ge ${PRINT_DIR_MIN} ]; then
  4           echo ${DIR}
  5         fi
  6 done
  7