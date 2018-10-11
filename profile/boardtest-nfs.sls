# Boardtest hosts with an exported NFS directory

include:
  - profile.nfs-server

file:
  mkdir:
    /export/boardtest:
      user: root
      group: {{ allgroups.groups.compute.gid }}
      mode: 1770
