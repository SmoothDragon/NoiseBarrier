DESTDIR = /usr/local
INSTALL = /usr/bin/install -p 
INSTALL_DIR = /bin/cp -rf

NAME = noise_barrier
SCRIPT = $(NAME).sh

install:
	[ -f /usr/bin/mplayer ]  # Install mplayer if this fails
	/bin/mkdir -m 755 -p /etc/init.d
	$(INSTALL) -m 755 $(SCRIPT) /etc/init.d
	/bin/mkdir -m 755 -p /opt/$(NAME)
	$(INSTALL) -m 755 brown50.mp4 /opt/$(NAME)
	/usr/sbin/update-rc.d $(SCRIPT) defaults

uninstall:
	/usr/sbin/update-rc.d -f $(SCRIPT) stop
	/usr/sbin/update-rc.d -f $(SCRIPT) remove
	-rm -f /etc/init.d/$(SCRIPT)
	-rm -rf /opt/$(NAME)

clean:
