#!/bin/bash

if [ -d local-repos ] ; then
    for repo in local-repos/*; do 
        for release in $repo/dists/*; do
            RELEASE=$(dirname $release)
            for section in $release/*; do
                if [ -d $section ] ; then
                    SECTION=$(dirname $section)
                    echo "deb file://$repo $release $SECTION" >> /etc/apt/sources.list.d/montavista.list
                fi
            done
        done
    done
fi

if [ -n "$SYSTEMD" ] ; then
    exec /sbin/init
else
    exec /bin/bash
fi
