#!/bin/sh
#assumes the user has egrep, wget, ssh, and scp
 
# Change this to match your router
architecture="x86_64"
 
# These should be fine unless you've changed something
user="root"
ip_address="192.168.10.1"
 
url="http://downloads.lede-project.org/snapshots/packages/x86_64/"
tmpdir="/tmp/luci-offline"
packages_base="liblua lua libuci-lua libubus libubus-lua uhttpd rpcd"
packages_luci="luci-base luci-lib-ip luci-lib-nixio luci-theme-bootstrap luci-mod-admin-full luci-lib-jsonc"
 
mkdir "$tmpdir"
cd "$tmpdir"
 
wget -N --quiet "${url}base/Packages"
for pkg in $packages_base; do
    pkgfile="$(egrep -oe " ${pkg}_.+" Packages | tail -c +2)"
    pkgurl="${url}base/${pkgfile}"
    wget -N --quiet "$pkgurl"
done
 
wget -N --quiet "${url}luci/Packages"
for pkg in $packages_luci; do
    pkgfile="$(egrep -oe " ${pkg}_.+" Packages | tail -c +2)"
    pkgurl="${url}luci/${pkgfile}"
    wget -N --quiet "$pkgurl"
done
 
wget -N --quiet "${url}luci"
for pkg in $packages_luci; do
    pkgfile="$(egrep -oe " ${pkg}_.+" Packages | tail -c +2)"
    pkgurl="${url}luci/${pkgfile}"
    wget -N --quiet "$pkgurl"
done
 
ssh "${user}@${ip_address}" mkdir -p /tmp/luci-offline-packages
scp *.ipk "${user}@${ip_address}":/tmp/luci-offline-packages
ssh "${user}@${ip_address}" opkg install /tmp/luci-offline-packages/*.ipk
ssh "${user}@${ip_address}" rm -rf /tmp/luci-offline-packages/
 
ssh "${user}@${ip_address}" /etc/init.d/uhttpd start
ssh "${user}@${ip_address}" /etc/init.d/uhttpd enable
 
cd
rm -rf "$tmpdir"
