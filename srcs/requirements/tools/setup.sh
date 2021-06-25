#!/bin/sh

DOMAIN_NAME="totaisei.42.fr"
grep -q $DOMAIN_NAME /etc/hosts
if [ $? -ne 0 ];then
	echo "127.0.0.1 $DOMAIN_NAME" >> /etc/hosts
fi
