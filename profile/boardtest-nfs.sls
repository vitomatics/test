# Boardtest hosts with an exported NFS directory

{% import_yaml "accounts/allgroups.yml" as allgroups %}


include:
  - profile.nfs-server
  - profile.boardtest-host

file:
  mkdir:
    /srv/boardtest/nfs:
      user: root
      group: {{ allgroups.groups.compute.gid }}
      mode: '01770'
    /srv/boardtest/tftpboot:
      user: root
      group: {{ allgroups.groups.compute.gid }}
      mode: '01770'
