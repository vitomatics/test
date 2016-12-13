# Pillar file for rsync-based backups

states:
  sfdump.slave: true

sfdump:
  # Keys for rsync dumps
  keys:
    sfdump_hog_key1:
      public: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjNdQu54ge0ZUkXZIL29ljagxF2JdzOQLqJsDr4TcjbzRRP2e4LSmqPG/TbN1FLJWD0S0NfcF6qKwPkbXtoDSKhLMmSQDGA17Vh6DLY9cKymxBI6uVQ0+QSXht1opGwN+kzx4w+wK+i3ncxDB4xve0LKT8nlm264UltkfPthDEIzWxE1mffs6AnNDM9VopkaVzveFzfq6+pWmXxAqQlas4gto2paCaWMe4uync6UwKbCfTWd+lB/Fc1pQaMMw5gRhDhT8u6E7r7rYXom3obcJkhLtzefnfWMKQlfBkLisVZnlsJZpcZG+fNtnZwtFgSLI6r6F2gpWk5LtNL4S9GOZ5 davidj@resilinix1.local
      private: |
        -----BEGIN RSA PRIVATE KEY-----
        MIIEowIBAAKCAQEAozXULueIHtGVJF2SC9vZY2oMRdiXczkC6ibA6+E3I280UT9n
        uC0pqjxv02zdRSyVg9EtDX3BeqisD5G17aA0ioSzJkkAxgNe1Yegy2PXCspsQSOr
        lUNPkEl4bdaKRsDfpM8eMPsCvot53MQweMb3tCyk/J5ZtuuFJbZHz7YQxCM1sRNZ
        n37OgJzQzPVaKZGlc73hc36uvqVpl8QKkJWrOILaNqWgmljHuLsp3OlMCmwn01nf
        pQfxXNaUGjDMOYEYQ4U/LuhO6+62F6Jt6G3CZIS7c3n531jCkJXwZC4rFWZ5bCWa
        XGRvnzbZ2cLRYEiyOq+hdoKVpOS7TS+EvRjmeQIDAQABAoIBAHsNA4vVjoBF3Z9M
        WOdN+ymD8/rZIN6DdloZm8x7wbmahyRWnJl0m3w5EsqhwnX79kIq/D+2t6AF+avH
        XRXqepKRGAzeb5HbSq3NEwMlpCUDlvjJrvzbgeo0KnMNlLVhh3xXl9iv91K4D8nN
        tQnqYSlbm4zGyrcp/PoA40WMbDmjaXgVmsny6Lwie8/QqBzYA9d24WJzMOshJn3w
        ogNZHh63tnZPWPlUdjCx64Gs4yoDz92hsmRW32zJwR+3iuy49GuD8C7Oa7mmEgUp
        9RGrXeEpEkjB5j0TxQwCyvuLPumlZvYPJj7YHoOEWqdI4WG+SeZ/94MZGcOn0fuv
        3iDZOC0CgYEA2RfdiNKL1DMrDlMhcR+lEEtKCSDgls+yW9DLgnKjjpbvPSW5bPLL
        ZAV+Tfc+vYQqJIG5YsX55y99IMUqMlZeC3DRUWy0P+i/n5ZF42CVxX7n4hK2zTBf
        OcH87kOCobrqCeH1PN5o9U7N90/JyHcZmrAU9YaPFYM19+eXOyIS4ZsCgYEAwHXW
        w9sBwCExKa+JgC1glmzFY9tI95t2P/h5lhcfJJhi5onIFqhuSkqjJaVjaAz0WD/N
        Hfhbje1ozBSt2MH5R6VkkorsfYNdHjAE9wX9Pek1Zau9yUpqgZSjaBv8N+h/Hcfd
        BYNWbyP3rbBpzTzZVlzPSkZGPLT1+nqddt5YE3sCgYABmm+EZympM4eJ34tLrpQl
        fqjZUGjYNEh47R3TpM0YbHzv0qt/5nsiDfhU0xKfi65T/rFDzXp+/pbJ+yrInGKt
        avPgyhC6uBlSMGXru/bfMoS74q9+7HCHmKsph04bq6m20PhirrHPvfk/blNrK5YA
        0nQVLB06Z3GqlwdC5ImHKQKBgD1V0Kn+Y+JtMZPNY46752pJI+cc/XYbz2W3tFgG
        6l/pSKucAW5nIy799lyLBtEkP8LYInCIs/TZUmqntHe96cnRhenF6HRfpw910j8/
        Y2OVrPTH9OXvl13QlvsY4BqZN9mv1lppbuRgnBB4hl9oIwOI9G8BUmUKbtHyvbgi
        SAN9AoGBAMxH0eOqaehw9UNWW6SV6wDpYsJWPePNP8jWsE7KvOc5udJOvVkvmJvE
        P43zpdDs8X2vbPRDEZom6BV8slPI7oPI/6WczDQKvI8Ur5v6EFbChmi+c191+U0y
        lNoAd73zzkzskJk1qwdgYSOKydzWrfDnIY6r1ddFGGutPISk/7YS
        -----END RSA PRIVATE KEY-----
  rsync:
    vulcan-srv:
      client: vulcan.internal.sifive.com
      server: heartofgold.internal.sifive.com
      src: /srv
      dest: /sfbackup/dumps/vulcan-srv
      startime: 03:00
      key: sfdump_hog_key1
