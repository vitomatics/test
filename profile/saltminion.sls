# salt minion stuff

states:
  sfsalt.minion: true

sfsalt:
  minion:
    master: salt.internal.sifive.com
    hash_type: sha256
    confname: 99-sfsalt.conf
    clearconf:
      - minion.d/99-sfpreseed.conf
      - minion.d/99-master-host.conf
      - minion.d/99-hash-type.conf
