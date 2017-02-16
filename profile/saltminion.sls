# test salt minion profile

states:
  sfsalt.minion: true

salt:
  minion:
    master:
      - salt.internal.sifive.com
    hash_type: sha256
    conffile:
      - 99-sfsalt.conf
    clearconf:
      - 99-sfpreseed.conf
      - 99-master-host.conf
      - 99-hash-type.conf
