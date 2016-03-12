############################################################
#
# Kerberos.io - Machinery
#
#############################################################

KERBEROSIO_MACHINERY_VERSION = develop
KERBEROSIO_MACHINERY_SITE = https://github.com/kerberos-io/machinery
KERBEROSIO_MACHINERY_SITE_METHOD = git
KERBEROSIO_MACHINERY_INSTALL_TARGET = YES
KERBEROSIO_MACHINERY_DEPENDENCIES = libcurl ffmpeg rpi-userland rpi-firmware rpi-armmem
KERBEROSIO_MACHINERY_MAKE=$(MAKE1)

define KERBEROSIO_MACHINERY_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 0644 package/kerberosio-machinery/kerberosio.service \
		$(TARGET_DIR)/usr/lib/systemd/system/kerberosio.service

	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants

	ln -fs ../../../../usr/lib/systemd/system/kerberosio.service \
		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/kerberosio.service
endef

define KERBEROSIO_MACHINERY_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 package/kerberosio-machinery/S99kerberosio \
		$(TARGET_DIR)/etc/init.d/S99kerberosio
endef

$(eval $(cmake-package))