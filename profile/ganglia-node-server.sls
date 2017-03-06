## Ganglia profile for a monitored server node

states:
  ganglia.monitor: true

ganglia:
  debug_level: 0
  cluster_name: sifive_server
  cluster_owner: help@sifive.com
  host_location: HE and SF

  udp_send_channesl:
    server_channel1:
      host: gmon0.internal.sifive.com
      port: 8650
    server_channel2:
      host: gmon1.internal.sifive.com
      port: 8650
