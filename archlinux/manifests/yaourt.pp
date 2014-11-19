define archlinux::yaourt( $package = $title ) {
  exec { "Install `$package'":
    command => "yaourt -S `$package' --noconfirm",
  }
}

