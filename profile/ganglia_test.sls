## Test ganglia profile

ganglia:
  debug_level: 0
  cluster_name: sifive
  cluster_owner: help@sifive.com

  host_location: HE

  udp_channels:
    chan1:
      address: 239.2.11.71
      port: 8649
      ttl: 1
      receive: true
  tcp_channels:
    chan1:
      port: 8649
  
