class asterisk::misdn inherits asterisk {

  # ?? forgot to remove a password?
  $password = 'Zi2dae9a'

  file {'/etc/asterisk/manager.conf.d/nagios.conf':
    ensure => present,
    mode => '0640',
    owner => root,
    group => asterisk,
    content => template('asterisk/nagios-manager.conf.erb'),
    notify => Exec['asterisk-reload'],
  }

  file {'/usr/lib/nagios/plugins/contrib/check_misdn.pl':
    ensure => present,
    mode => '0755',
    owner => root,
    group => root,
    content => template('asterisk/check_misdn.pl.erb'),
    require => File['/etc/asterisk/manager.conf.d/nagios.conf'],
  }

}
