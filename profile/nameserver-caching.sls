# Pillar config for caching name server with copies of local zones.


states:
  bind: true

firewall:
  ports:
    tcp:
      53: any
    udp:
      53: any
