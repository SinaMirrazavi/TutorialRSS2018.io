Veewee::Session.declare({
  :cpu_count => '1',
  :memory_size => '512',
  :disk_size => '8192',
  :disk_format => 'VDI',
  :hostiocache => 'off',
  :os_type_id => 'FreeBSD_64',
  :iso_file => 'FreeBSD-10.3-RELEASE-amd64-disc1.iso',
  :iso_src => 'http://ftp.freebsd.org/pub/FreeBSD/releases/ISO-IMAGES/10.3/FreeBSD-10.3-RELEASE-amd64-disc1.iso',
  :iso_sha256 => 'fef068cf6dea26923ab84b62ba9f21461ca0bdec90a0741c8ffb0e1ca29e410d',
  :iso_download_timeout => '1000',
  :boot_wait => '10',
  :boot_cmd_sequence => [
    '<Esc>',
    'boot -s',
    '<Enter>',
    '<Wait>' * 10,
    '/bin/sh<Enter>',
    'mdmfs -s 100m md1 /tmp<Enter>',
    'dhclient -l /tmp/dhclient.lease.em0 em0<Enter>',
    '<Wait>' * 10,
    'fetch -o /tmp/install.sh http://%IP%:%PORT%/install.sh && chmod +x /tmp/install.sh && /tmp/install.sh %NAME%<Enter>',
  ],
  :kickstart_port => '7122',
  :kickstart_timeout => '300',
  :kickstart_file => 'install.sh',
  :ssh_login_timeout => '10000',
  :ssh_user => 'root',
  :ssh_password => 'vagrant',
  :ssh_key => '',
  :ssh_host_port => '7222',
  :ssh_guest_port => '22',
  :sudo_cmd => "sh '%f'",
  :shutdown_cmd => 'shutdown -p now',
  :postinstall_files => %w[../freebsd-postinstall.sh],
  :postinstall_timeout => '10000',
  :skip_iso_transfer => true,
})