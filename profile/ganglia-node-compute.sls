## Ganglia profile for a monitored compute node

states:
  ganglia.monitor: true

ganglia:
  debug_level: 0
  cluster_name: sifive_compute
  cluster_owner: help@sifive.com
  host_location: HE

  udp_send_channels:
    sending_channel:
      mcast_join: 239.2.11.71
      port: 8649
      ttl: 5
  udp_recv_channels:
    receiving_channel:
      mcast_join: 239.2.11.71
      bind: 239.2.11.71
      port: 8649
  tcp_accept_channels:
    data_channel:
      port: 8649

firewall:
  ports:
    tcp:
      8649: 10.14.16.75 10.14.16.76
    udp:
      8649: 10.14.16.0/20
