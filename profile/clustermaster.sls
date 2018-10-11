## pillar file for tardis

{% import_yaml "site/sifive1.yml" as site %}


include:
  - accounts/cluster-accounts
  - profile.telegraf-host-base
  - secret.telegraf-influxdb1


states:
  autofs: true
  nfs4: true
  telegraf: true

nfs4:
  domain: {{ site.nfs4.domain }}

autofs:
  lookup:
    browse_mode: yes
  direct:
    /home: -fstype=nfs4,nfsvers=4.1,rw,hard,intr,acl,noatime,nodev,nosuid,retry=30 netapp1-nfs1.internal.sifive.com:/homes
    /sifive: -fstype=nfs4,nfsvers=4.1,rw,hard,intr,acl,noatime,nodev,nosuid,retry=30 netapp1-nfs1.internal.sifive.com:/sifive
    /work: -fstype=nfs4,nfsvers=4.1,rw,hard,intr,acl,noatime,nodev,nosuid,retry=30 netapp1-nfs2.internal.sifive.com:/work
  maps:
    nettmp:
      mountpoint: /nettmp
      map:
        netapp1a: -fstype=nfs4,nfsvers=4.1,rw,hard,intr,acl,noatime,nodev,nosuid,retry=30 netapp1-nfs2.internal.sifive.com:/nettmp

# Monitor the disks we have just mounted

telegraf:
  agent:
    input:
      disk:
        netapps:
          interval: 60
          mount_points:
            - /sifive
            - /work
            - /home
            - /nettmp/netapp1a

pam:
  access:
    nfsroot: ALL
    sysadmin: ALL


sudo:
  included:
    sifive-nfsroot:
      userspec:
        - '%nfsroot':
            - ALL: '(ALL:ALL) ALL'
      
  

sfaccount:
  lookup:
    home: /home
  servers:
    {{grains.id}}: true
    
