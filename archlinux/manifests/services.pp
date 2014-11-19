class archlinux::services {
  service { 'wicd':
    require => Package['wicd'],
  }
}
