#!/bin/bash


git clone --depth 1 -b packages https://github.com/xiaorouji/openwrt-passwall passwall-packages && mv -n passwall-packages/* ./ && rm -rf passwall-packages
git clone --depth 1 -b luci https://github.com/xiaorouji/openwrt-passwall passwall-luci && mv -n passwall-luci/luci-app-passwall ./ ; rm -rf passwall-luci


# Delete duplicated packages
rm -Rf */.git


sed -i \
-e 's?include \.\./\.\./\(lang\|devel\)?include $(TOPDIR)/feeds/packages/\1?' \
-e 's?2. Clash For OpenWRT?3. Applications?' \
-e 's?\.\./\.\./luci.mk?$(TOPDIR)/feeds/luci/luci.mk?' \
-e 's/ca-certificates/ca-bundle/' \
-e 's/php7/php8/g' \
-e 's/+docker /+docker +dockerd /g' \
*/Makefile



exit 0

