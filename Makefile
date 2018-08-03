DESTDIR=
PREFIX=/usr
BINDIR=/bin
MANDIR=/man/man1
ZSHCOMPDIR=/share/zsh/site-functions
BASHCOMPDIR=/share/bash/bash-completion/completions
SYSTEMDUNITDIR=/lib/systemd/system

INSTALL=install
RM=rm
SHELLCHECK=shellcheck

.PHONY: test check install uninstall

test check:
	$(SHELLCHECK) usbctl

install:
	$(INSTALL) -Dm 755 usbctl -t "${DESTDIR}${PREFIX}${BINDIR}"
	$(INSTALL) -Dm 644 contrib/systemd/deny-new-usb.service -t "${DESTDIR}${PREFIX}${SYSTEMDUNITDIR}"
	$(INSTALL) -Dm 644 contrib/completion/bash/usbctl -t "${DESTDIR}${PREFIX}${BASHCOMPDIR}"
	$(INSTALL) -Dm 644 contrib/completion/zsh/_usbctl -t "${DESTDIR}${PREFIX}${ZSHCOMPDIR}"
	$(INSTALL) -Dm 644 doc/usbctl.1 -t "${DESTDIR}${PREFIX}${MANDIR}"

uninstall:
	$(RM) -f "${DESTDIR}${PREFIX}${BINDIR}/usbctl"
	$(RM) -f "${DESTDIR}${PREFIX}${SYSTEMDUNITDIR}/deny-new-usb.service"
	$(RM) -f "${DESTDIR}${PREFIX}${BASHCOMPDIR}/usbctl"
	$(RM) -f "${DESTDIR}${PREFIX}${ZSHCOMPDIR}/_usbctl"
	$(RM) -f "${DESTDIR}${PREFIX}${MANDIR}/usbctl.1"
