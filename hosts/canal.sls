states:
  postfix.gateway: true
  opensmtpd: false

postfix:
  networks:
    - 127.0.0.0/8
    - 10.14.0.0/16
    - 10.15.0.0/16
  domains:
    - internal.sifive.com
