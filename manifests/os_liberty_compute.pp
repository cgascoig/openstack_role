class role::os_liberty_compute (
  String $admin_password,
  String $controller_host,
) {
  include profile::base
  
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