SUDO = sudo
MKDIR = mkdir --parents
LINK = ln --symbolic --force
PACMAN_FLAGS = --sync --refresh --needed --noconfirm
MAKE = make
TOUCH = touch

PACKAGES = \
	git \
	ttf-dejavu \
	ttf-droid \
	ttf-bitstream-vera \
	evince \
	zip \
	unzip \
	unrar \
	p7zip \
	wicd \
	wicd-gtk \
	chromium \
	flashplugin \
	httpie \
	vlc \
	ntp \
	deluge \
	python \
	python-pip \
	mongodb \
	gparted \
	shutter \
	wtf \
	chruby \
	ack \
	irssi \
	gvim \
	zsh \
	thunderbird \
	tmux \
	xorg-xrandr \
	xscreensaver \
	aws-cli

.PHONY: install yaourt packages git ack irssi tmux vim zsh
install: yaourt packages  git ack irssi tmux vim zsh

yaourt: $(HOME)/.yaourt

$(HOME)/.yaourt:
	echo | $(SUDO) tee --append /etc/pacman.conf
	echo '[archlinuxfr]' | $(SUDO) tee --append /etc/pacman.conf
	echo 'SigLevel = Never' | $(SUDO) tee --append /etc/pacman.conf
	echo 'Server = http://repo.archlinux.fr/$$arch' | $(SUDO) tee --append /etc/pacman.conf

	$(SUDO) pacman $(PACMAN_FLAGS) yaourt
	$(TOUCH) $(HOME)/.yaourt

packages:
	yaourt $(PACMAN_FLAGS)
	yaourt --sync --needed $(PACKAGES)

# Install PHP and dependencies
php: $(HOME)/.php.5.6 php-pear-dependencies php-pecl-dependencies

.PHONY: php-pear-dependencies
php-pear-dependencies: $(HOME)/.php.5.6
	$(SUDO) pear install -f PHP_CodeSniffer

.PHONY: php-pecl-dependencies
php-pecl-dependencies: $(HOME)/.php.5.6 $(HOME)/.xdebug

$(HOME)/.xdebug:
	$(SUDO) pecl install -f xdebug
	$(SUDO) $(LINK) $(CURDIR)/php/php.ini /etc/php/conf.d/php.ini
	$(SUDO) $(LINK) $(CURDIR)/php/php-debug /usr/bin/php-debug
	$(TOUCH) $(HOME)/.xdebug

$(HOME)/.php.5.6:
	yaourt $(PACMAN_FLAGS) php php-pear php-composer
	$(TOUCH) $(HOME)/.php.5.6

# Install Ruby 2.1.2
ruby: $(HOME)/.ruby.2.1.2

$(HOME)/.ruby.2.1.2: $(HOME)/.ruby-install
	$(SUDO) ruby-install ruby 2.1.2
	$(TOUCH) $(HOME)/.ruby.2.1.2

# Install ruby-install
$(HOME)/.ruby-install:
	$(SUDO) wget -O /tmp/ruby-install-0.5.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.5.0.tar.gz
	$(SUDO) tar -xzvf /tmp/ruby-install-0.5.0.tar.gz -C /tmp/ruby-install-0.5.0
	$(SUDO) $(MAKE) -C /tmp/ruby-install-0.5.0/ install
	$(TOUCH) $(HOME)/.ruby-install

# Configure git
git: $(HOME)/.gitconfig $(HOME)/.gitignore

$(HOME)/.gitconfig:
	$(LINK) $(CURDIR)/git/config $(HOME)/.gitconfig

$(HOME)/.gitignore:
	$(LINK) $(CURDIR)/git/ignore $(HOME)/.gitignore

# Configure Ack
ack: $(HOME)/.ack

$(HOME)/.ack:
	$(LINK) $(CURDIR)/ack/config $(HOME)/.ack

# Configure IRSSI
irssi: $(HOME)/.irssi

$(HOME)/.irssi:
	$(LINK) $(CURDIR)/irssi $(HOME)/.irssi

# Configure Tmux
tmux: $(HOME)/.tmux $(HOME)/.tmux.conf

$(HOME)/.tmux:
	$(MKDIR) $(HOME)/.tmux

$(HOME)/.tmux.conf:
	$(LINK) $(CURDIR)/tmux/config $(HOME)/.tmux/config
	$(LINK) $(CURDIR)/tmux/tmux.conf $(HOME)/.tmux.conf

# Configure Vim
vim: $(HOME)/.vim/bundle/vundle $(HOME)/.vim/config $(HOME)/.vimrc update-vim-plugins

$(HOME)/.vim/bundle/vundle:
	$(MKDIR) $(HOME)/.vim/bundle
	git clone git://github.com/gmarik/vundle.git $(HOME)/.vim/bundle/vundle

$(HOME)/.vim/config:
	$(LINK) $(CURDIR)/vim/config $(HOME)/.vim/config

$(HOME)/.vimrc:
	$(MKDIR) $(HOME)/.vim
	$(LINK) $(CURDIR)/vim/vimrc $(HOME)/.vimrc

.PHONY: update-vim-plugins
update-vim-plugins:
	vim -u $(HOME)/.vim/config/plugins/vundle.vim +BundleInstall +qa

# Configure oh-my-zsh
zsh: $(HOME)/.zsh $(HOME)/.zshrc $(HOME)/.oh-my-zsh

$(HOME)/.zshrc:
	$(LINK) $(HOME)/.oh-my-zsh/zshrc $(HOME)/.zshrc

$(HOME)/.zsh:
	chsh -s /bin/zsh
	$(TOUCH) $(HOME)/.zsh

$(HOME)/.oh-my-zsh:
	git clone git://github.com/stupied4ever/oh-my-zsh.git $(HOME)/.oh-my-zsh
