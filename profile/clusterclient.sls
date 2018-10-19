# "clusterclient" is a profile for NFS client machines that as used by
# engineeers to do real work but without direct NX-based login.
# The associated packages are in profile "devel".

{% import_yaml "site/sifive1.yml" as site %}
{% import_yaml "accounts/allgroups.yml" as allgroups %}

states:
  autofs: true
  nfs4: true

nfs4:
  domain: {{ site.nfs4.domain }}

autofs:
  lookup:
    browse_mode: yes
  direct:
    /sifive: -fstype=nfs4,nfsvers=4.1,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs1.internal.sifive.com:/sifive
    /work: -fstype=nfs4,nfsvers=4.1,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs2.internal.sifive.com:/work
  home:
    '*': -fstype=nfs4,nfsvers=4.1,rw,hard,intr,acl,noatime,nodev,nosuid,nobrowse netapp1-nfs1.internal.sifive.com:/homes/&
  maps:
    nettmp:
      mountpoint: /nettmp
      map:
        netapp1a: -fstype=nfs4,nfsvers=4.1,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs2.internal.sifive.com:/nettmp


pam:
  access:
    compute: ALL
    consult: ALL EXCEPT LOCAL
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
      group: {{ allgroups.groups.compute.gid }}
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
  included:
    # Memers of the eda group can sudo to eda
    sifive-eda:
      userspec:
        - '%eda':
          - ALL: '(eda:eda) ALL'
    # Requested by user sols
    sifive-perf:
      absent: true
