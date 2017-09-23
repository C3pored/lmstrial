#!/bin/sh

BINDIR="/etc/sysconfig/tcedir"
CARD=`cat /usr/local/sbin/config.cfg | grep "^OUTPUT=" | cut -d'"' -f2`
PNAME=`cat /usr/local/sbin/config.cfg | grep "NAME" | cut -d'"' -f2`

echo "Start LMSMonitor. SNDCard: ${CARD}, Player: ${PNAME}"

sudo modprobe i2c_dev
nohup sudo ${BINDIR}/lmsmonitor -n ${PNAME} -o "${CARD}" > /dev/null &

#sudo cp ${BINDIR}/gpio /usr/bin/
#nohup sudo ${BINDIR}/IQ_rot > /dev/null &

exit
