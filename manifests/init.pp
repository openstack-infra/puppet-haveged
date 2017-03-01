# Install and run haveged to provide entropy
class haveged (
  # Not in base CentOS, so might need to enable repos
  $haveged_install_options = [],
) {

  package { 'haveged':
    ensure          => present,
    install_options => $haveged_install_options,
  }

  service { 'haveged':
    enable  => true,
    require => Package[haveged],
  }

}
