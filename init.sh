#!/bin/bash
set -x 
if [ -e /APT-GPG-KEY-ERS ] ; then
    apt-key add /APT-GPG-KEY-ERS
fi
if [ -d local-repos ] ; then
    for repo in /local-repos/*; do 
        for release in $repo/dists/*; do
            RELEASE=$(basename $release)
            for section in $release/*; do
                if [ -d $section ] ; then
                    SECTION=$(basename $section)
                    echo "deb file://$repo ./$RELEASE $SECTION" >> /etc/apt/sources.list.d/montavista.list
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
