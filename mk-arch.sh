#!/bin/sh
set -e

mkdir arch
sudo pacstrap -c -d arch busybox glibc zlib
sudo sh -c 'chown -R $SUDO_USER:users arch'
cd arch
bin/busybox --list | while read cmd
do
	ln -s /bin/busybox bin/$cmd
done

echo "Cleaning up"

rm -rf usr/share/man
rm -rf var/lib/pacman
rm -rf usr/share/doc
rm -rf usr/include
rm -rf usr/share/info
rm -rf etc/pacman.d
find usr/lib/gconv -type f -and -name '*.so' -and ! -name ANSI_X3.110.so -and ! -name UNICODE.so -exec rm {} \; 
rm usr/lib/*.a
rm usr/lib/*.o
find usr/share/i18n/charmaps -type f ! -name ANSI_X3.110-1983.gz -and ! -name UTF-8.gz -exec rm {} \;
find usr/share/i18n/locales -type f ! -name 'translit_*' -and ! -name en_US -exec rm {} \;
find usr/share/zoneinfo -type f ! -name UTC -and ! -name '*.tab' -exec rm -rf {} \;
find usr/share/zoneinfo -type d -empty -delete
find var/cache -type f -delete
rm -rf var/log/*
rm -rf usr/share/iana-etc #doesnt look that important
rm -rf usr/share/locale #en_US is not using it
