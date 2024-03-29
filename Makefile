DESTDIR = /usr/local
INSTALL = /usr/bin/install -p 
INSTALL_DIR = /bin/cp -rf

NAME = noise_barrier
SCRIPT = $(NAME).sh
SERVICE = $(NAME).service

install:
	sudo $(INSTALL) -m 644 $(SERVICE) /etc/systemd/system
	sudo /bin/mkdir -m 755 -p /opt/$(NAME)
	sudo $(INSTALL) -m 755 $(SCRIPT) /opt/$(NAME) 
	sudo $(INSTALL) -m 755 brown50.mp4 /opt/$(NAME)
	sudo systemctl enable $(SERVICE)
	sudo systemctl start $(SERVICE)

uninstall:
	sudo systemctl stop $(SERVICE)
	sudo systemctl disable $(SERVICE)
	sudo /bin/rm -f /etc/systemd/system/$(SERVICE)
	sudo /bin/rm -rf /opt/$(NAME)

# This is horrible and I admit it. I couldn't find another way.
# VLC disallows running as root. This disables that.
monkey_patch:
	sudo sed -i 's/geteuid/getppid/' /usr/bin/vlc

unmonkey_patch:
	sudo sed -i 's/getppid/geteuid/' /usr/bin/vlc


status:
	systemctl status $(SERVICE)
