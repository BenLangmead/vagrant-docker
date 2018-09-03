#!/bin/sh

[ ! -d /wd ] && echo "/wd directory not mounted in container" && exit 1

cd /wd
vagrant $*
