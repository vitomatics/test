# Pillar file for rsync-based backups

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
    sfdump_omega1_key1:
      public: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIrT2qKW6RZuC2Xo/myOw9FMCECBm4OkndcwmAokqQ5XMt0gaJDMHRDD608kkQRx1ibxv9VEUIM4eaX2rG2T0gaqmG/ecy5knmVA8I4/Pd6cig4i2vrDYDDH8xDiOIiVgYZPJ8FblIOw5mZXTiDhFFOGkye4rE1QzAqcGLqBLnBomw5QrSm7c0D1iJk+mJCSzJ4bI7swJFzMF24XURnMtO/BlALmZhd8hNoPLe4PxV6I+aBRyxchCHDWCPHHcq23Co5fnGwD9z2ZNZ2HZ2OZpZVFL5xDsaQJBHDAK06inrHwQQ+HnRAQmUo91Wqi7r0wzMHlfffsflkghvND+Rp1LN davidj@heartofgold.internal.sifive.com
      private: |
        -----BEGIN RSA PRIVATE KEY-----
        MIIEpQIBAAKCAQEAyK09qilukWbgtl6P5sjsPRTAhAgZuDpJ3XMJgKJKkOVzLdIG
        iQzB0Qw+tPJJEEcdYm8b/VRFCDOHml9qxtk9IGqphv3nMuZJ5lQPCOPz3enIoOIt
        r6w2Awx/MQ4jiIlYGGTyfBW5SDsOZmV04g4RRThpMnuKxNUMwKnBi6gS5waJsOUK
        0pu3NA9YiZPpiQksyeGyO7MCRczBduF1EZzLTvwZQC5mYXfITaDy3uD8VeiPmgUc
        sXIQhw1gjxx3KttwqOX5xsA/c9mTWdh2djmaWVRS+cQ7GkCQRwwCtOop6x8EEPh5
        0QEJlKPdVqou69MMzB5X337H5ZIIbzQ/kadSzQIDAQABAoIBAC94g8DQAj7VFk0t
        u169otykHxJclDD3YOfIwbOzMG5sSL3LFA6xfNvFyMOnGM+H8xSI8hcQKzBQeEB1
        V93oH8SeVrH/OATbYxngQpo4ykRxfCtKtcH7u98mwqPJE3DGBJfosU/XF7hVeAeS
        8n5TE5TLTl9JyD7doyGkRouR277YatPxsgmsS4ZkTnx7gqfBAhJHItRiK/cL/88a
        f/eRbl8+byt+TEu62ACov66b7jaXOf5YRbJ7KNZb3UYAO785KEHNlEWn20MSkhwo
        Jbwpuxhmm9uZzyc4yGWxHH6NUgpx+MbcFnJnOCMJOIkUNGqSnKXCh7v2xIlfzH/k
        n7KpwQECgYEA5o5wyvMsgm3ziy66+A6V7Trn3+q1Q9+Rapyga6dtPzCUi3S8i2sD
        Ry+VEo0Xah2VuIk3HfaiPqPFTYninh0kWDfFZ8vqwBX3rqJqGpRVQWA2d44y0Flp
        VvqFEFeQBQdvAcXN8+69XnmBSRni132dkMSo98hpGwER0nYtYytDYUECgYEA3tKn
        q8uUkldgKu/o5Hpwcadtl4nLr/JpIct4SbLRze2cq030isq+OPbMnAySUmOQTt/B
        wh1leKjuBNJO5/DRtNYn80UoFH8G0DZDPtS9cFY0dYPyVeFjhiRs4uGOxwze3nad
        JpRg2rVkmtZvkS4OQzwqM0hNKsSw/fuEqch4Qo0CgYEAgAS7sJVSM6IlxzTNcIt4
        yF8a/YRv3h43uoD5uo0e5iVtdfn971QeX9qV5dUeGTgQOIVIa4TVFf8NwT487Rq1
        YZ6mKDpcQQhxnTBlxhhzNnfcBoqYwIPFMByu4iIcwA4en1dcQoRf9iN1nEeZY5pG
        cWohgGRxqCLx6HDiRtxw74ECgYEAhyGX3/8BplJpFwER62Y5xSN1uh4uMhFAIuej
        loZk6I8+oUEQmg9kl2VNJyIUpvSMstjOR+vN+wPv/WqRweXxN8tcxRLewLdcqW8P
        Dw6zqGoPPGl90Ql0cwiqJFoIXbz3eFDU822u41R4o9KCLLiSm8HkEd+6NMK+V/lu
        Ng1GqY0CgYEAxKKz1OIvRjIiADCdAZMUDzHeGHy/lC9H8u8JWG2UGkdxC/Omv5o8
        h5uZsCnXLCsqksnebzklqbItDt6F4vDSUzZZO25RA/g1gATdT8U9ufGxMdTxytpe
        SYDmKIA/7RlfXJgXosQV/IPS/DUy6BLfYF4Cpo3kVzPrJami2A274ds=
        -----END RSA PRIVATE KEY-----
  rsync:
    vulcan-srv:
      client: vulcan.internal.sifive.com
      server: heartofgold.internal.sifive.com
      src: /srv
      dest: /sfbackup/dumps/vulcan-srv
      compression: false
      acls: true
      xattrs: true
      key: sfdump_hog_key1
