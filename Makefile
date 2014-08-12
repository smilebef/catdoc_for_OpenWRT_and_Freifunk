#
# Copyright (C) 2007-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=catdoc
PKG_VERSION:=0.94.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ftp.wagner.pp.ru/pub/catdoc/
PKG_MD5SUM:=243e1680bb3e703616f5adecfee24491
#PKG_BUILD_DIR:= # Wo Compilieren? Das Verzeichnis nach dem Entpacken.
#PKG_CAT:= # Wie entpacken
#PKG_BUILD_DEPENDS:= # Pakete zum bauen aber nicht fuer Laufzeit
#PKG_INSTALL:= #  "1" ruft das original "make install" mit Option PKG_INSTALL_DIR
#PKG_INSTALL_DIR:= # Installationsverzeichniss
#PKG_FIXUP:= # Nicht dokumentiert! Für Crosscompile bugs.

# @SF steht für sourceforge.org
# $(BUILD_DIR) ist das Verzeichniss, wo wget aufgerufen wird.



include $(INCLUDE_DIR)/package.mk


define Package/catdoc
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=
  TITLE:=doc, xls, ppt to text converter
  URL:=http://www.wagner.pp.ru
endef

define Package/catdoc/description
	catdoc is program which reads one or more Microsoft word files and outputs text, 
	contained insinde them to standard output. Therefore it does same work for .doc files, as unix cat command for plain ASCII files.
endef


define Build/Compile
	$(call Build/Compile/Default)
	$(MAKE) -C $(PKG_BUILD_DIR) installroot=$(PKG_INSTALL_DIR) DESTDIR="$(PKG_INSTALL_DIR)" install
endef

define Package/catdoc/install
	$(INSTALL_DIR) $(1)/usr/bin/
	#$(INSTALL_DIR) $(1)/usr/lib/
	#$(INSTALL_DIR) $(1)/usr/lib/swish-e/
	#$(INSTALL_DIR) $(1)/usr/lib/swish-e/perl
	#$(INSTALL_DIR) $(1)/usr/lib/swish-e/perl/SWISH
	#$(INSTALL_DIR) $(1)/usr/lib/swish-e/perl/SWISH/Filters
	#$(INSTALL_DIR) $(1)/www
	#$(INSTALL_DIR) $(1)/etc
	#$(INSTALL_DIR) $(1)/www/swish-e
	#$(INSTALL_DIR) $(1)/www/swish-e/doc
	#$(INSTALL_DIR) $(1)/www/swish-e/indexfiles
	#$(INSTALL_DIR) $(1)/www/swish-e/indexfiles/local
	#$(INSTALL_DIR) $(1)/www/cgi-bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	#$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib/
	#$(CP)  $(PKG_INSTALL_DIR)/usr/lib/swish-e/* $(1)/usr/lib/swish-e/
	#$(INSTALL_DATA)   ./files/etc/* $(1)/etc/
	#$(INSTALL_DATA)   ./files/www/swish-e/index.html $(1)/www/swish-e/
	#$(INSTALL_DATA)   ./files/www/swish-e/doc/* $(1)/www/swish-e/doc/
	#$(INSTALL_DATA)   ./files/www/swish-e/indexfiles/local/* $(1)/www/swish-e/indexfiles/local/
	#$(INSTALL_BIN)    ./files/www/cgi-bin/swish-e.cgi $(1)/www/cgi-bin/
	#$(INSTALL_BIN)    ./files/usr/bin/* $(1)/usr/bin/

endef

$(eval $(call BuildPackage,catdoc))
