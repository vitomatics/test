## Generic license server profile

states:
  firewall.iptables: true
  flexnet: true
  flexnet.checkexpire: true
  flexnet.checklogs: true

flexnet:
  lookup:
    logdir: /srv/flexlm/log
    licensedir: /srv/flexlm/licenses
    downloaddir: /srv/flexlm/downloads
    vendordir: /srv/flexlm/vendor
    user: flexlm
    group: nogroup
    checkmailto: flexlm-check@sifive.com
    checkmaildays: '7'
    logmailto: root@sifive.com
    logmaildays: '14'
