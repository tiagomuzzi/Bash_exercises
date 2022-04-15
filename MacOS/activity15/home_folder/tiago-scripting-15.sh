#!/bin/bash
# This script must not be moved or it might fail.
# To choose where the logfiles will go, run the fixGenerator.sh with the working path as an argument. 
# e.g. ./fixGenerator FixGen
# In this script we point it towards logs/

#creates logs/ if there isn't one
logchecker=`ls FixGen | grep logs | wc -l `
if [ $logchecker -eq 0 ]; then
    mkdir FixGen/logs
    echo "$TODAY: logs folder created" > tiago-scripting-15.log
fi

#compresses and removes all logs but the three most recent ones
TODAY=`date "+%Y-%m-%d"`
logcount=`ls -U FixGen/logs/fixlog* | wc -l`
if [ $logcount -gt 3 ]; then
    files=`echo $(($logcount - 3))`
    oldlogs=`ls -U FixGen/logs/fixlog* | head -$files`
    tar -cvzf FixGen/logs/oldlogs.$TODAY.tar.gz $oldlogs
    rm $oldlogs
    echo "$TODAY: oldlogs compressed successfully." >> tiago-scripting-15.log
fi


#run FixGenerator.sh
chmod +x FixGen/fixGenerator.sh
./FixGen/fixGenerator.sh FixGen/logs
echo "$TODAY: Fixgenerator Script ran successfully." >> tiago-scripting-15.log

# add a cronjob that runs every friday at 6am
ISACTIVE=`crontab -l | grep '0 6 \* \* 5 ./tiago-scripting-15.sh' | wc -l `
if [ $ISACTIVE -eq 0 ]; then
    crontab -l > crontab_new
    echo "0 6 * * 5 ./tiago-scripting-15.sh" >> crontab_new
    crontab crontab_new
    rm crontab_new
    chmod +x tiago-scripting-15.sh
    echo "$TODAY: Cronjob added successfully." >> tiago-scripting-15.log
fi

exit 0