# Profile for mail server

include:
  - secret.mailserver

states:
  postfix.gateway: true
  opensmtpd: false

pkgs:
  list:
    postfix-doc: true

postfix:
  networks:
    - 127.0.0.0/8
    - 10.14.0.0/16
    - 10.15.0.0/16
    - 10.17.15.0/24
  domain: internal.sifive.com


firewall:
  ports:
    tcp:
      25: 10.14.0.0/16 10.15.0.0/16 10.17.15.0/24

