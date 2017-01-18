## Setup to enable system authentication/authorizatoin
## ref: http://icephoenix.us/linuxunix/apache-and-http-authentication-with-pam/

pkgs:
  list:
    pwauth: true
    libapache2-mod-authnz-external: true
    libapache2-mod-authz-unixgroup: true
    pwauth: true

