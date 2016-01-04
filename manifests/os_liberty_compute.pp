class role::os_liberty_compute (
  String $admin_password,
  String $controller_host,
  String $os_username,
  String $os_password, #Not plain text!
  String $ssh_key, #RSA public key
) {
  class {'profile::base':
    os_username     => $os_username,
    os_password     => $os_password,
    ssh_key         => $ssh_key,
  }
  
  class { 'profile::nova_compute':
    db_host                   => $controller_host,
    db_password               => $admin_password,
    
    rabbit_host               => $controller_host,
    rabbit_password           => $admin_password,
    
    glance_host               => $controller_host,
    keystone_host             => $controller_host,
    vncproxy_host             => $controller_host,
    
    neutron_keystone_password => $admin_password,
  }
  
  class { 'profile::neutron_compute':
    rabbit_host       => $controller_host,
    rabbit_password   => $admin_password,
  }
}