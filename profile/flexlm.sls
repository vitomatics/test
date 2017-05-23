nss:
  passwd:
    flexlm:
      uid: 998
      gid: nogroup
      home: /usr/local/flexlm
      shell: /sbin/nologin
      gecos: 'FlexNet Manager'
      system: true

pkgs:
  list:
    lsb-core: true

file:
  ln:
    /usr/tmp: /tmp
