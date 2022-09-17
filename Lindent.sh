#!/bin/sh
# SPDX-License-Identifier: GPL-2.0

# apt update && apt-get install indent

set -x

PARAM="-npro -kr -i8 -ts8 -sob -l80 -ss -ncs -cp1"
# PARAM=-npro -kr -i8 -ts8 -sob -l80 -ss -ncs -cp1

# $ indent --version
# GNU indent 2.2.12
# $ indent --version | cut -d' ' -f3
# 2.2.12
RES=`indent --version | cut -d' ' -f3`
if [ "$RES" = "" ]; then
	exit 1
fi
V1=`echo $RES | cut -d'.' -f1`
V2=`echo $RES | cut -d'.' -f2`
V3=`echo $RES | cut -d'.' -f3`
# V1=2
# V2=2
# V3=12

if [ $V1 -gt 2 ]; then
  PARAM="$PARAM -il0"
elif [ $V1 -eq 2 ]; then
  if [ $V2 -gt 2 ]; then
    PARAM="$PARAM -il0"
  elif [ $V2 -eq 2 ]; then
    if [ $V3 -ge 10 ]; then
      PARAM="$PARAM -il0"
    fi
  fi
fi
# PARAM=-npro -kr -i8 -ts8 -sob -l80 -ss -ncs -cp1 -il0

indent $PARAM "$@"
# indent -npro -kr -i8 -ts8 -sob -l80 -ss -ncs -cp1 -il0 topic_01/6-2.c
