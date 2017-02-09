# test salt minion profile

states:
  salt.minion: true

salt:
  minon:
    master:
      - salt.internal.sifive.com
