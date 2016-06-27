#! /bin/bash

set -e
set -x

cp $MP_PREFIX/etc/macports/sources.conf $$
awk -v repo="file://$PWD" '{if($NF=="[default]") print repo; print}' $$ > $$.new
sudo mv -f $$.new $MP_PREFIX/etc/macports/sources.conf
echo "** NEW SOURCES"
cat $MP_PREFIX/etc/macports/sources.conf
echo "** END NEW SOURCES"
rm -f $$
portindex

