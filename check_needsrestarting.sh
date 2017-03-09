#!/bin/bash

#####
#
# Monitoring plugin to check if programms need to be restarted on CentOS or other RHEL based distributions.
#
# Copyright (c) 2017 Jan Vonde <mail@jan-von.de>
#
#
# Usage: sudo ./check_needsrestarting.sh
#
#
# Changelog:
#   2017-03-09: added better output and perfdata
#   2017-03-04: initial version
#
# For more information visit https://github.com/janvonde/check_needsrestarting
#####



type -P needs-restarting &>/dev/null || { echo "ERROR: needs-restarting is required but seems not to be installed. (yum-goodies)  Aborting." >&2; exit 1; }



OUTPUT=$(needs-restarting 2>&1)
LINECOUNT=$(echo "${OUTPUT}" | wc -l)
RETURNCODE=$?



if [ "${RETURNCODE}" != "0" ]; then
	echo "CRITICAL: needs-restarting exited with ${RETURNCODE} \n ${OUTPUT} | processes=${LINECOUNT}";
	exit 2
fi

if [ "${OUTPUT}" != "" ]; then
	echo "WARNING: ${LINECOUNT} processes need to be restarted \n ${OUTPUT} | processes=${LINECOUNT}";
	exit 1
fi

echo "OK: No processes need to be restarted | processes=${LINECOUNT}";
exit 0

