#!/bin/bash
mk-build-deps -i -r -t 'apt-get -y' /opt/consul-deb/debian/control
pushd /opt/consul-deb && gbp buildpackage $GIT_BUILDPACKAGE_OPTIONS && gbp buildpackage -S -d --git-builder="debuild -eGOPATH -eGIT_DESCRIBE -eGIT_COMMIT -i -I -uc -us"
cp /tmp/build-area/* /tmp/consul-deb
