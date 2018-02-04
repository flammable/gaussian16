USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make
TITLE=gaussian16
REVERSE_DOMAIN=com.gaussian
PACKAGE_VERSION=1.0.4
PAYLOAD=\
	pack-script-preinstall\
	pack-usr-local-outset-login-once-gaussian_setup_16.sh\
	pack-usr-local-outset-login-every-gaussian_cache_clean.sh\
	ungz-applications-gaussview16\
	ungz-applications-gaussian16\
	pack-script-postinstall

ungz-applications-gaussview16: l_Applications
	@sudo ${TAR} xjf gv-6016-MacOSX_x86_64.tbz -C ${WORK_D}/Applications
	@sudo chown -R root:admin "${WORK_D}/Applications/gv/"
	@sudo chmod -R 755 "${WORK_D}/Applications/gv/"

ungz-applications-gaussian16: l_Applications
	@sudo ${TAR} xjf M64-108X.tbz -C ${WORK_D}/Applications
	@sudo chown -R root:admin "${WORK_D}/Applications/g16/"
	@sudo chmod -R 755 "${WORK_D}/Applications/g16/"

munkiimport: pkg
		munkiimport \
--nointeractive \
--subdirectory apps \
--name "${TITLE}" \
--displayname "Gaussian 16" \
--description "Gaussian 16 is the latest in the Gaussian series of programs. It provides state-of-the-art capabilities for electronic structure modeling. Gaussian 16 is licensed for a wide variety of computer systems. All versions of Gaussian 16 contain every scientific/modeling feature, and none imposes any artificial limitations on calculations other than your computing resources and patience." \
--category "Sciences" \
--developer "Gaussian, Inc." \
--minimum_os_version "10.6.8" \
--requires "Add Gaussian User" \
--requires "outset" \
--RestartAction="RequireRestart" \
"${PACKAGE_FILE}"