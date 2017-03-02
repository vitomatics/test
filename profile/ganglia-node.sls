## Ganglia profile for a monitored node

states:
  ganglia.monitor: true

ganglia:
  debug_level: 0
  cluster_name: sifive
  cluster_owner: help@sifive.com
  host_location: HE

  udp_send_channels:
    sending_channel:
      mcast_join: 239.2.11.71
      port: 8649
      ttl: 1
  udp_recv_channels:
    receiving_channel:
      mcast_join: 239.2.11.71
      bind: 239.2.11.71
      port: 8649
  tcp_accept_channels:
    data_channel:
      port: 8649
  
