nss:
  passwd:
    flexlm:
      uid: 998
      gid: flexlm
      home: /usr/local/flexlm
      shell: /sbin/nologin
      gecos: 'FlexNet Manager'
      system: true
  group:
    flexlm:
      gid: 998
      system: true

pkgs:
  list:
    lsb-core: true

file:
  ln:
    /usr/tmp: /tmp
