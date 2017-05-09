# Called by startnode
if [ ! -e $STARTUP ]; then
  echo "G:" >> $STARTUP.tmp
  echo "cd vbbs" >> $STARTUP.tmp
  echo "BBS $FOUNDNODE /AC /H /B38400" >> $STARTUP.tmp
  echo "exitemu" >> $STARTUP.tmp
  unix2dos $STARTUP.tmp &> /dev/null
  mv $STARTUP.tmp $STARTUP
fi

