#!/bin/bash

echo="/bin/echo"
mkdir="/bin/mkdir"
chown="/usr/sbin/chown"
chmod="/bin/chmod"
python="/usr/bin/python"

current_user=$(${python} -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')

# create the caches directory and set appropriate permissions
${mkdir} -p ${HOME}/Library/Caches/gaussian
${chown} -R ${current_user}:gaussian ${HOME}/Library/Caches/gaussian/
${chmod} -R 770 ${HOME}/Library/Caches/gaussian/

# the tcsh stuff
# ${echo} "setenv g16root /Applications" >> ${HOME}/.login
# ${echo} "source \$g16root/g16/bsd/g16.login" >> ${HOME}/.login

# set the caches directory for tcsh
# ${echo} "setenv GAUSS_SCRDIR ${HOME}/Library/Caches/gaussian" >> ${HOME}/.login

# the bash stuff
${echo} "export g16root=/Applications" >> ${HOME}/.bash_profile
${echo} ". \$g16root/g16/bsd/g16.profile" >> ${HOME}/.bash_profile

# set the caches directory for bash
${echo} "export GAUSS_SCRDIR=${HOME}/Library/Caches/gaussian" >> ${HOME}/.bash_profile

exit
