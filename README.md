# dev-box

Here I will store all my scripts to automate my dev machine. Many of them was
inspired by [leafac/dev-box][leafac-dev-box]. It automates my machine
configurations, such [vim][vim], [tmux][tmux], [ruby][ruby], [git][git],
[zsh][zsh] and [oh-my-zsh][oh-my-zsh] configurations.

## Environment

Currently my environment is an [Arch Linux][arch-linux] with [Xfce][xfce]
as [Desktop Environment][desktop-environment] and [SLiM][slim] as
[Display manager][display-manager].

## How to install

### Cloning

```
$ pacman -S git openssh
$ git clone git@github.com:stupied4ever/dev-box.git

$ cd dev-box
$ ./scripts/install.sh
```

## License

```
            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004

 Copyright (C) 2013 Rafael da Silva Almeida <eusou@rafaelalmeida.net>

 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. You just DO WHAT THE FUCK YOU WANT TO.
```

[leafac-dev-box]: https://github.com/leafac/dev-box
[vim]: http://www.vim.org/
[tmux]: http://tmux.sourceforge.net/
[ruby]: https://www.ruby-lang.org
[git]: http://git-scm.com/
[zsh]: http://www.zsh.org/
[oh-my-zsh]: https://github.com/leafac/oh-my-zsh
[arch-linux]: http://archlinux.org/
[xfce]: http://www.xfce.org/
[desktop-environment]: https://wiki.archlinux.org/index.php/Desktop_Environment
[slim]: http://slim.berlios.de/
[display-manager]: https://wiki.archlinux.org/index.php/Display_Manager
