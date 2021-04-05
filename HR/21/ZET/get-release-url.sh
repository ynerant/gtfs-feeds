#!/bin/bash

#
# get URL to download latest GTFS feed
#

SCANURL="https://www.zet.hr/odredbe/datoteke-u-gtfs-formatu/669"

LOCATION=$(curl -s $SCANURL -o - | \
           egrep -i 'href="https://www.zet.hr/UserDocsImages/Dokumenti i obrasci za preuzimanje/GTFS-[0-9]+\.[0-9]+\.[0-9][0-9][0-9][0-9]\.\.zip' | \
           head -1 | \
           sed -e 's/^.*href="https:/https:/i' \
               -e 's/".*$//')

if [ -n "$LOCATION" ]
then
    RELEASE_URL=$LOCATION
fi

echo $RELEASE_URL