## pillar file for epsilon*

states:
  firewall.iptables: true

## The Spectre fix
pkgs:
  list:
    intel-microcode: true


nfs:
  server:
    exports:
      boardtest:
        path: /srv/boardtest/nfs
        clients:
          10.14.0.0:
            - rw
            - root_squash
