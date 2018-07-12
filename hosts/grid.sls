## pillar file for grid

# Enabled firewalling.

states:
  firewall.iptables: true

# network - static - serveral services
network:
  interfaces:
    ens2:
      ip: 10.14.16.75

# A VG for the srv directory
disksetup:
  vgs:
    grid00:
      disks:
        - /dev/vdb
  lvs:
    srv:
      size: 40G
      vg: grid00
    scratch:
      size: 8G
      vg: grid00

  mounts:
    /srv:
      fstype: ext4
      opts: noatime
      lv: grid00/srv
    /scratch:
      fstype: ext4
      opts: noatime
      lv: grid00/scratch

  dirs:
    /srv/mysql:
      # permissions and ownership will be set by mysql profile
    /scratch:
      mode: 0777
      user: root
      group: root
    /scratch/mysql/tmp:
      mode: 0777
      user: root
      group: root
      makedirs: true

  # Note that moving the mysql datadir does not work due to setup scripts
  # in the mariadb package
  links:
    /var/lib/mysql:
      target: /srv/mysql
      force: true

mysql:
  server:
    mysqld:
      tmpdir: /scratch/mysql/tmp
