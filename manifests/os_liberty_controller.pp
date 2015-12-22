class role::os_liberty_controller {
  $admin_password = 'C1sco123'
  
  include profile::base
  class {'profile::mysql':
    root_password    => $admin_password,
  }
  
  class {'profile::rabbitmq':
    username => 'openstack',
    password => $admin_password,
  }
}