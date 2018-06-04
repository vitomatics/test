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
    /work: -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs2.internal.sifive.com:/work
  home:
    '*': -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid,nobrowse netapp1-nfs1.internal.sifive.com:/homes/&
  maps:
    nettmp:
      mountpoint: /nettmp
      map:
        netapp1a: -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs2.internal.sifive.com:/nettmp


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
    # This is from aou@sifive.com, presumably for NFS
    net.core.rmem_max: 67108864
    net.core.wmem_max: 67108864
    net.core.netdev_max_backlog: 300000
    net.ipv4.tcp_rmem: 4096 87380 33554432
    net.ipv4.tcp_wmem: 4096 65536 33554432
    net.ipv4.tcp_congestion_control: htcp

sudo:
  aliases:
    hosts:
      JENKINS:
        - b0.internal.sifive.com
        - alpha.internal.sifive.com
        - gamma00.internal.sifive.com
        - gamma01.internal.sifive.com
        - gamma02.internal.sifive.com
        - gamma03.internal.sifive.com
        - gamma04.internal.sifive.com
        - gamma05.internal.sifive.com
        - gamma06.internal.sifive.com
        - gamma07.internal.sifive.com
        - gamma10.internal.sifive.com
        - gamma11.internal.sifive.com
        - gamma12.internal.sifive.com
        - gamma13.internal.sifive.com
        - gamma14.internal.sifive.com
        - gamma15.internal.sifive.com
        - sigma00.internal.sifive.com
        - sigma01.internal.sifive.com
        - sigma02.internal.sifive.com
        - sigma03.internal.sifive.com
        - sigma04.internal.sifive.com
        - sigma05.internal.sifive.com
        - sigma06.internal.sifive.com
        - sigma07.internal.sifive.com
        - sigma08.internal.sifive.com
        - sigma09.internal.sifive.com
        - delta00.internal.sifive.com
        - delta01.internal.sifive.com
        - delta02.internal.sifive.com
        - delta03.internal.sifive.com
      INTERACTIVE:
        - gamma00.internal.sifive.com
        - gamma01.internal.sifive.com
        - gamma02.internal.sifive.com
        - gamma03.internal.sifive.com
        - gamma04.internal.sifive.com
        - gamma05.internal.sifive.com
        - gamma06.internal.sifive.com
        - gamma07.internal.sifive.com
        - gamma10.internal.sifive.com
        - gamma11.internal.sifive.com
        - gamma12.internal.sifive.com
        - gamma13.internal.sifive.com
        - gamma14.internal.sifive.com
        - gamma15.internal.sifive.com
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
    - '%perf-user': 
      - INTERACTIVE: '/usr/bin/perf top *'
      - INTERACTIVE: '/usr/bin/perf top'
