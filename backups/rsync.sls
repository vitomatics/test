# Pillar file for rsync-based backups

sfdump:
  # Keys for rsync dumps
  keys:
    sfdump_hog_key1:
      public: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjNdQu54ge0ZUkXZIL29ljagxF2JdzOQLqJsDr4TcjbzRRP2e4LSmqPG/TbN1FLJWD0S0NfcF6qKwPkbXtoDSKhLMmSQDGA17Vh6DLY9cKymxBI6uVQ0+QSXht1opGwN+kzx4w+wK+i3ncxDB4xve0LKT8nlm264UltkfPthDEIzWxE1mffs6AnNDM9VopkaVzveFzfq6+pWmXxAqQlas4gto2paCaWMe4uync6UwKbCfTWd+lB/Fc1pQaMMw5gRhDhT8u6E7r7rYXom3obcJkhLtzefnfWMKQlfBkLisVZnlsJZpcZG+fNtnZwtFgSLI6r6F2gpWk5LtNL4S9GOZ5 sfdump_hog_key1
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
    sfdump_hog_key2:
      public: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJmtAaqg2GsKxh9YFQ/tXVtdffiOe8WpYuUUuPndQ3YcKLgmMG079LQvzo1RZtSrAzZO/ack6Vjo1cp36Yg0wuUlUoEg+SRfy2al9QJYFOVyEe2lL9b3hKG628CZjcboDC2eQ62kg5Zfa0MHKAut1U3quWKOQjNzN3Y7EhQmSu33Ew9GBBFxDcI1uWrYgaQpOglYYszBgyhuxBnRUAcEr6QlTGiVSEcMjovqtM3vjm6wRKwBV52ugQbK8qExgLLNEKALSu5UBrAqnd5f3libc/oBS/trBnxB96M5W0sw9Y5HGrJ8P0jDW41Dph5x4bH86OlfFmJM3RnpNvvCL9JrpD sfdump_hog_key2
      private: |
        -----BEGIN RSA PRIVATE KEY-----
        MIIEowIBAAKCAQEAyZrQGqoNhrCsYfWBUP7V1bXX34jnvFqWLlFLj53UN2HCi4Jj
        BtO/S0L86NUWbUqwM2Tv2nJOlY6NXKd+mINMLlJVKBIPkkX8tmpfUCWBTlchHtpS
        /W94ShutvAmY3G6AwtnkOtpIOWX2tDBygLrdVN6rlijkIzczd2OxIUJkrt9xMPRg
        QRcQ3CNblq2IGkKToJWGLMwYMobsQZ0VAHBK+kJUxolUhHDI6L6rTN745usESsAV
        edroEGyvKhMYCyzRCgC0ruVAawKp3eX95Ym3P6AUv7awZ8QfejOVtLMPWORxqyfD
        9Iw1uNQ6YeceGx/OjpXxZiTN0Z6Tb7wi/Sa6QwIDAQABAoIBADpAORD7QZ1BPw2u
        2gaFG1P8jrtP22VY5zvK0YJVoBPAc23L5sD6PbOJT3oW17wMcIzpBUSg8oPUBJRY
        8QMwLLrVnzVMwqMJBdPPOGr36zyvgCph+sivhJolFTXXsAtBAoNKYd9/Yo7zHy1B
        MlRvqbP0ArAIcKKcOIqui2eIv36nHc0HC+SGAqjJ53lfupBEiGTE7ga6mlD6447r
        gm/7O1pdDwQSc8oxcStl6JGde85W2Iv1m3EpimnluEdBJ2eE1E57Z2hlbhnotFts
        s+YSlV+0JnlTVKyrZlzMhVBVhaYn6rOXXVHKdlmEQxJEYMwgbpn6b8R+vU5+BzeX
        x5W4bkECgYEA41hG8i1KfeeoRyvo8ZwCtyr5DeyUzwUtvCjbKjKr0WtZY8nk/x9S
        gL8OXw55bH+3hiQJkgG1U7xtGTtZwYPnunjQN0QPBvureXvrveZUpcqGeMNp6If0
        y6d7pYGjzRuY8FO1LDf4GP7DA74m+4cgG5IS+kseS76t86nV/NAMoXcCgYEA4wP7
        Scws8zplA0jRg1mY+I/SE4KdJw9tdZ15i0G9ZlbhdcjRAMGE39ZQhzGpLe7l9in7
        hhTnBKdGZaDxKdoO9aTE58oODVEui+7jOO3sV55JOLwIPQE6d4Lcrpe2YjQG0OU1
        lOi1UEMrwdp72T43XIn2cywiR333k7ElpYHJQJUCgYAT7PjK4Q1WW6d0FXUlN/dE
        9o89mS6xtlJ721jaKfbFNBNxm5Bmi+g/QH+R9ULPL6J2L1JnaZ7q5+jn/Tuwqk71
        GQGm1mA6zHQLAcF3s2hX35hJnVb6+m+KKfO8XdBtea294phOd9lW131gJppkEUPP
        Js5jAZJ2MRAt+wS2U8XHoQKBgC8ZW2BjQQwxmFWHHRjQVQF07VPo7Gv3MnGNe3Md
        74q1Cc/jGyG6BLRgBZMXBY+nGgTpjuqxmYCIp/1b180kFah3R/cDH8k5h5u2s2PT
        UQ6Yo35m3Jqzj4rOFrUOeuODAcsDUwuTAFMnrINqrflThC7p3LzmcjI8+0mkHjhp
        ZfTFAoGBAKba9aA885gFptrEi+eXnyGri5KUbMyJIdFno6rz54NTxW4WWnhtb795
        BdxgC+/MJFdPutSZko1A1qp0ffrQLbJoZ75ZJ7iFx5aEe+TZwETfYa/jn54U7uBk
        ofSfhpRLCbMcvEgPE1jJXu4my3DuMUlaK1qSqZwZKuU3ZTfiBciz
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
      days: 3
      weeks: 4
    nihilanth-etc:
      absent: true      ###################
      client: nihilanth.internal.sifive.com
      server: heartofgold.internal.sifive.com
      src: /usr/local/etc
      dest: /sfbackup/dumps/nihilanth-etc
      compression: false
      acls: false
      xattrs: false
      key: sfdump_hog_key1
      days: 3
      weeks: 4
    breencast-ldap-db:
      client: breencast.internal.sifive.com
      server: heartofgold.internal.sifive.com
      src: /var/db/openldap-data
      dest: /sfbackup/dumps/breencast-ldap-db
      compression: false
      acls: false
      xattrs: false
      key: sfdump_hog_key1
      days: 4
      weeks: 2
    breencast-ldap-config:
      client: breencast.internal.sifive.com
      server: heartofgold.internal.sifive.com
      src: /usr/local/etc/openldap
      dest: /sfbackup/dumps/breencast-ldap-config
      compression: false
      acls: false
      xattrs: false
      key: sfdump_hog_key2
      days: 4
      weeks: 2
    gonarch-srv:
      client: gonarch.internal.sifive.com
      server: heartofgold.internal.sifive.com
      src: /srv
      dest: /sfbackup/dumps/gonarch-srv
      compression: false
      acls: false
      xattrs: false
      key: sfdump_hog_key1
      days: 4
      weeks: 2
    dalek-srv-onsite:
      client: dalek.internal.sifive.com
      server: heartofgold.internal.sifive.com
      src: /srv
      dest: /sfbackup/dumps/dalek-srv
      compression: false
      acls: false
      xattrs: false
      key: sfdump_hog_key1
      days: 4
      weeks: 2
    dalek-srv-offsite:
      client: dalek.internal.sifive.com
      server: omega1.internal.sifive.com
      src: /srv
      dest: /sfbackup/dumps/dalek-srv
      compression: false
      acls: false
      xattrs: false
      key: sfdump_omega1_key1
      days: 4
      weeks: 2
    i0-license:
      client: i0.internal.sifive.com
      server: heartofgold.internal.sifive.com
      src: /var/lib/sflxc/rootfs/license/usr/local/flexlm
      dest: /sfbackup/dumps/i0-license
      compression: false
      acls: false
      xattrs: false
      key: sfdump_hog_key1
      days: 10
      weeks: 10
    grid-srv-onsite:
      client: grid.internal.sifive.com
      server: heartofgold.internal.sifive.com
      src: /srv
      dest: /sfbackup/dumps/grid-srv
      compression: false
      acls: false
      xattrs: false
      key: sfdump_hog_key1
      days: 4
      weeks: 2
    yoda-srv-onsite:
      client: yoda.internal.sifive.com
      server: heartofgold.internal.sifive.com
      src: /srv
      dest: /sfbackup/dumps/yoda-srv
      compression: false
      acls: false
      xattrs: false
      key: sfdump_hog_key1
      days: 2
      weeks: 8
    yoda-srv-offsite:
      client: yoda.internal.sifive.com
      server: omega1.internal.sifive.com
      src: /srv
      dest: /sfbackup/dumps/yoda-srv
      compression: false
      acls: false
      xattrs: false
      key: sfdump_omega1_key1
      days: 2
      weeks: 8
