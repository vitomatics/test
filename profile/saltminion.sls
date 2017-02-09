# test salt minion profile

states:
  salt.minion: true

salt:
  minion:
    master:
      - salt.internal.sifive.com
