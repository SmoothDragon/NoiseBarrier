DESTDIR = /usr/local
INSTALL = /usr/bin/install -p 
INSTALL_DIR = /bin/cp -rf

NAME = noise_barrier
SCRIPT = $(NAME).sh
SERVICE = $(NAME).service

install:
	$(INSTALL) -m 644 $(SERVICE) /etc/systemd/system
	/bin/mkdir -m 755 -p /opt/$(NAME)
	$(INSTALL) -m 755 $(SCRIPT) /opt/$(NAME) 
	$(INSTALL) -m 755 brown50.mp4 /opt/$(NAME)
# 	systemctl enable $(SERVICE)
# 	systemctl start $(SERVICE)

uninstall:
	systemctl stop $(SERVICE)
	systemctl disable $(SERVICE)
	-rm -f /etc/systemd/system/$(SERVICE)
	-rm -rf /opt/$(NAME)

clean:
