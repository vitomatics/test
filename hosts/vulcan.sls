## pillar file for vulcan

states:
  firewall.iptables: true

pam:
  access:
    jenkins-admin: ALL

sudo:
  userspec:
    - root:
      - ALL: '(ALL:ALL) ALL'
    - '%sysadmin':
      - ALL: '(ALL:ALL) ALL'
    - 'mikeyang':
      - ALL: '(ALL:ALL) ALL'
    - '%jenkins-admin': 
      - JENKINS: /usr/sbin/iotop
      - JENKINS: (jenkins) ALL


# A VG for data
disksetup:
  vgs:
    vulcan00:
      disks:
        - /dev/vdb
  lvs:
    srv:
      size: 39.9G
      vg: vulcan00
  mounts:
    /srv:
      fstype: ext4
      opts: noatime
      lv: vulcan00/srv

