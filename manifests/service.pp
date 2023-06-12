# @summary Manage the Netbox and Netvox-rq Systemd services
#
# @param software_directory
#   The directory where the netbox installation is unpacked
#
# @param user
#   The user running the
#   service.
#
# @param group
#   The group running the
#   service.
#
# A class for running Netbox as a Systemd service
#
class netbox::service (
  Stdlib::Absolutepath $software_directory,
  String $user,
  String $group,
) {
  $_netbox_pid_file = '/var/tmp/netbox.pid'

  $service_params_netbox_rq = {
    'netbox_home'  => $software_directory,
    'user'         => $user,
    'group'        => $group,
  }

  $service_params_netbox = {
    'netbox_home'  => $software_directory,
    'user'         => $user,
    'group'        => $group,
    'pidfile'      => $_netbox_pid_file,
  }

  systemd::unit_file { 'netbox-rq.service':
    content => epp('netbox/netbox-rq.service.epp', $service_params_netbox_rq),
    enable  => true,
    active  => true,
  }

  systemd::unit_file { 'netbox.service':
    content => epp('netbox/netbox.service.epp', $service_params_netbox),
    enable  => true,
    active  => true,
  }
}
