class role::os_liberty_controller (
  String $admin_password,
){
  
  
  include profile::base
  class {'profile::mysql':
    root_password    => $admin_password,
  }
  
  class {'profile::rabbitmq':
    username => 'openstack',
    password => $admin_password,
  }
  
  class {'profile::keystone':
    admin_token         => $admin_password,
    db_password         => $admin_password,
    rabbit_password     => $admin_password,
    admin_user_password => $admin_password,
    admin_user_email    => 'admin@aci.ceclab.info',
  }
  
  class {'profile::glance':
    db_password         => $admin_password,
    rabbit_password     => $admin_password,
    keystone_password   => $admin_password,
  }
  
  class {'profile::nova_controller':
    db_password               => $admin_password,
    rabbit_password           => $admin_password,
    keystone_password         => $admin_password,
    neutron_keystone_password => $admin_password,
  }
}