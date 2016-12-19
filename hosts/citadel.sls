apt:
  repos:
    x2go:
      types: [ deb, deb-src ]
      uri: http://packages.x2go.org/debian
      suite: jessie
      keyid: E1F958385BFE2B6E
      keyserver: keys.gnupg.net

  pkgs:
    x2go-keyring: ~
    x2goserver: ~

sshd:
  options:
    PasswordAuthentication: no
    X11Forwarding: yes

pam:
  access:
    compute: ALL EXCEPT LOCAL
    consult: ALL EXCEPT LOCAL

states:
  homedirs.extractor: true
  autofs: true


# Copied from compute.sls - a hack until retirement

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
