states:
  sendmail.absent: True
  openntpd: true

nss:
  shells:
    /bin/zsh: /usr/local/bin/zsh
    /bin/bash: /usr/local/bin/bash

pkgs:
  pkgng:
    repos:
      FreeBSD:
        enabled: false
      SiFive:
        url: 'http://pkg.internal.sifive.com/packages/${ABI}'
        enabled: true
        priority: 100
