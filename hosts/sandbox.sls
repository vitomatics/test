## pillar file for sandbox


# network - dhcp

states:
  firewall.iptables: true

sfsalt:
  minion:
    master:
      - salt0.internal.sifive.com
      - salt1.internal.sifive.com
    master_type: failover
    master_shuffle: false
    retry_dns: 0
    hash_type: sha256
    confname: 99-sfsalt.conf
    clearconf:
      - minion.d/99-sfpreseed.conf
      - minion.d/99-master-host.conf
      - minion.d/99-hash-type.conf
