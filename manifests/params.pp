# these parameters need to be accessed from several locations and
# should be considered to be constant
class nova::params {

  case $::osfamily {
    'RedHat': {
      # package names
      $api_package_name         = 'openstack-nova-api'
      $cert_package_name        = 'openstack-nova-cert'
      $common_package_name      = 'openstack-nova-common'
      $compute_package_name     = 'openstack-nova-compute'
      $consoleauth_package_name = 'openstack-nova-console'
      $doc_package_name         = 'openstack-nova-doc'
      $libvirt_package_name     = 'libvirt'
      $libvirt_type_qemu        = 'libguestfs-tools'
      $network_package_name     = 'openstack-nova-network'
      $numpy_package_name       = 'numpy'
      $objectstore_package_name = 'openstack-nova-objectstore'
      $scheduler_package_name   = 'openstack-nova-scheduler'
      $tgt_package_name         = 'scsi-target-utils'
      $volume_package_name      = 'openstack-nova-volume'
      $vncproxy_package_name    = 'openstack-nova-novncproxy'
      # service names
      $api_service_name         = 'openstack-nova-api'
      $cert_service_name        = 'openstack-nova-cert'
      $compute_service_name     = 'openstack-nova-compute'
      $consoleauth_service_name = 'openstack-nova-consoleauth'
      $libvirt_service_name     = 'libvirtd'
      $network_service_name     = 'openstack-nova-network'
      $objectstore_service_name = 'openstack-nova-objectstore'
      $scheduler_service_name   = 'openstack-nova-scheduler'
      $tgt_service_name         = 'tgtd'
      $vncproxy_service_name    = 'openstack-nova-novncproxy'
      $volume_service_name      = 'openstack-nova-volume'
      $special_service_provider = 'init'
      # redhat specific config defaults
      $root_helper              = 'sudo nova-rootwrap'
      $lock_path                = '/var/lib/nova/tmp'
      $nova_db_charset          = 'latin1'
    }
    'Debian': {
      # package names
      $api_package_name         = 'nova-api'
      $cert_package_name        = 'nova-cert'
      $common_package_name      = 'nova-common'
      $compute_package_name     = 'nova-compute'
      $doc_package_name         = 'nova-doc'
      $libvirt_package_name     = 'libvirt-bin'
      $libvirt_type_qemu        = 'guestmount'
      $network_package_name     = 'nova-network'
      $vncproxy_package_name    = ['novnc', 'nova-novncproxy']
      $numpy_package_name       = 'python-numpy'
      $objectstore_package_name = 'nova-objectstore'
      $scheduler_package_name   = 'nova-scheduler'
      $tgt_package_name         = 'tgt'
      $volume_package_name      = 'nova-volume'
      # service names
      $api_service_name         = 'nova-api'
      $cert_service_name        = 'nova-cert'
      $compute_service_name     = 'nova-compute'
      $consoleauth_service_name = 'nova-consoleauth'
      $libvirt_service_name     = 'libvirt-bin'
      $network_service_name     = 'nova-network'
      $vncproxy_service_name    = 'nova-novncproxy'
      $objectstore_service_name = 'nova-objectstore'
      $scheduler_service_name   = 'nova-scheduler'
      $volume_service_name      = 'nova-volume'
      $tgt_service_name         = 'tgt'
      # debian specific nova config
      $root_helper              = 'sudo nova-rootwrap'
      $lock_path                = '/var/lock/nova'
      $nova_db_charset          = 'latin1'
      case $::operatingsystem {
        'Debian': {
          $consoleauth_package_name = 'nova-console'
          # Use default provider on Debian
          $special_service_provider = undef
        }
        default: {
          $consoleauth_package_name = 'nova-consoleauth'
          # some of the services need to be started form the special upstart provider
          $special_service_provider = 'upstart'
        }
      }
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only support osfamily RedHat and Debian")
    }
  }

}
