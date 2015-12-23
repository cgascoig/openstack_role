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
}