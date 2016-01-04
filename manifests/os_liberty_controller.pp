class role::os_liberty_controller (
  String $admin_password,
  String $os_username,
  String $os_password, #Not plain text!
  String $ssh_key, #RSA public key
){
  
  
  class {'profile::base':
    os_username     => $os_username,
    os_password     => $os_password,
    ssh_key         => $ssh_key,
  }
  
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
    db_password                           => $admin_password,
    rabbit_password                       => $admin_password,
    keystone_password                     => $admin_password,
    
    neutron_metadata_proxy_shared_secret  => $admin_password,
    neutron_keystone_password             => $admin_password,
  }
  
  class {'profile::neutron_controller':
    db_password                           => $admin_password,
    rabbit_password                       => $admin_password,
    keystone_password                     => $admin_password,
  
    neutron_metadata_proxy_shared_secret  => $admin_password,
    nova_keystone_password             => $admin_password,
  }

  class {'profile::horizon':
  }
}