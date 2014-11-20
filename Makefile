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
	php

.PHONY: install packages git ack irssi tmux vim zsh
install: packages  git ack irssi tmux vim zsh

packages:
	yaourt $(PACMAN_FLAGS) $(PACKAGES)

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
	$(LINK) $(CURDIR)/git/.gitconfig $(HOME)/.gitconfig

$(HOME)/.gitignore:
	$(LINK) $(CURDIR)/git/.gitignore $(HOME)/.gitignore

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
