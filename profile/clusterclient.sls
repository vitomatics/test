# "compute" is a profile for NFS client machines that as used by
# engineeers to do real work but without direct NX-based login.
# The associated packages are in profile "devel".


states:
  autofs: true
  nfs4: true

nfs4:
  domain: internal.sifive.com

autofs:
  lookup:
    browse_mode: yes
  direct:
    /sifive: -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs1.internal.sifive.com:/sifive
    /work: -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs1.internal.sifive.com:/work
  home:
    '*': -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid,nobrowse netapp1-nfs1.internal.sifive.com:/homes/&
  maps:
    nettmp:
      mountpoint: /nettmp
      map:
        netapp1a: -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs1.internal.sifive.com:/nettmp


pam:
  access:
    compute: ALL
    consult: ALL EXCEPT LOCAL
    jenkins: 10.14.0.10 # jenkins.internal.sifive.com
  limits:
    domains:
      '@compute':
        - type: soft
          item: stack
          value: 16384
        - type: hard
          item: stack
          value: unlimited

file:
  mkdir:
    /scratch:
      user: root
      group: compute
      mode: 1770

sshd:
  options:
    X11Forwarding: yes

sysctl:
  params:
    net.core.rmem_max: 67108864
    net.core.wmem_max: 67108864
    net.core.netdev_max_backlog: 300000
    net.ipv4.tcp_rmem: 4096 87380 33554432
    net.ipv4.tcp_wmem: 4096 65536 33554432
    net.ipv4.tcp_congestion_control: htcp

sudo:
  alias:
    hosts:
      JENKINS:
        - b0
        - i0
        - gamma00
        - gamma01
        - gamma02
        - gamma03
        - gamma04
        - gamma05
        - gamma06
        - gamma07
        - gamma10
        - gamma11
        - gamma12
        - gamma13
        - gamma14
        - gamma15
  userspec:
    - root:
      - ALL: '(ALL:ALL) ALL'
    - '%sysadmin':
      - ALL: '(ALL:ALL) ALL'
    - '%eda':
      - ALL: '(eda:eda) ALL'
    - '%jenkins-admin': 
      - JENKINS: /usr/sbin/iotop
      - JENKINS: (jenkins) ALL
