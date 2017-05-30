## Setup to enable system authentication/authorization
## ref: http://icephoenix.us/linuxunix/apache-and-http-authentication-with-pam/

pkgs:
  list:
    pwauth: true
    libapache2-mod-authnz-external: true
    libapache2-mod-authz-unixgroup: true

apache:
  modules:
    enabled:
      - authnz_external
      - authz_unixgroup
