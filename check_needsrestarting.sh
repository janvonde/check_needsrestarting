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
#   2017-03-04: initial version
#
# For more information visit https://github.com/janvonde/check_needsrestarting
#####


## error handling
type -P needs-restarting &>/dev/null || { echo "ERROR: needs-restarting is required but seems not to be installed. (yum-goodies)  Aborting." >&2; exit 1; }


OUTPUT=$(needs-restarting 2>&1)
RETURNCODE=$?


if [ "${RETURNCODE}" != "0" ]; then
	echo "CRITICAL: needs-restarting exited with ${RETURNCODE} ${OUTPUT}";
	exit 2
fi

if [ "${OUTPUT}" != "" ]; then
	echo "WARNING: ${OUTPUT}";
	exit 1
fi

echo "OK";
exit 0

